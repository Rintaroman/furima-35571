class HistoriesController < ApplicationController
  def index
    @furima = Furima.find(params[:furima_id])
  end

  def create
    @buyer = Buyer.new(buyer_paramas)
    if @buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buyer_paramas
    params.require(:buyer).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id, ).merge(user_id: current_user.id)
  end
end
