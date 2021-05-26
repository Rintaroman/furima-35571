class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  before_action :set_index, only: [:index, :create]
  before_action :set_history, only: [:index, :create]


  def index
    @history_buyer = HistoryBuyer.new
    if @furima.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @history_buyer = HistoryBuyer.new(buyer_params)
    if @history_buyer.valid?
      set_item
      @history_buyer.save
      redirect_to root_path
    else
      @furima = Furima.find(params[:furima_id])
      render :index
    end
  end


  private

  def buyer_params
    params.require(:history_buyer).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id ).merge(user_id: current_user.id, furima_id: params[:furima_id], token: params[:token])
  end

  def set_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @furima.price,  
        card: buyer_params[:token],    
        currency: 'jpy'                 
      )
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def set_index
    if @furima.user_id == current_user.id
      redirect_to root_path
    end  
  end

  def set_history
    if @furima.history.present?
      redirect_to root_path
    end    
  end

end
