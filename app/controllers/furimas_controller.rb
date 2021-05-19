class FurimasController < ApplicationController

  def index
  end

  def new
    @furima = Furima.new
  end

  def create
    Furima.create(furima_paramas)
  end


  private

  def furima_paramas
    params.require(:item).permit(:product, :content, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :time_required_id, :image).merge(user_id: current_user.id)
  end


  

end
