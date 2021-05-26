class HistoriesController < ApplicationController
  def index
    @furima = Furima.find(params[:furima_id])
    @history_buyer = HistoryBuyer.new
  end

  def create
    @furima = Furima.find(params[:furima_id])
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


end
