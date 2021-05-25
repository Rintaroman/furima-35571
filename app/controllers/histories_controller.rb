class HistoriesController < ApplicationController
  def index
    @furima = Furima.find(params[:furima_id])
    @history_buyer = HistoryBuyer.new
  end

  def create
    @history_buyer = HistoryBuyer.new(buyer_paramas)
    if @history_buyer.valid?
      @history_buyer.save
      redirect_to root_path
    else
      @furima = Furima.find(params[:furima_id])
      render :index
    end
  end


  private

  def buyer_paramas
    params.require(:history_buyer).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id ).merge(user_id: current_user.id, furima_id: params[:furima_id])
  end

end
