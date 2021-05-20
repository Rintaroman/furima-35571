class FurimasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :delete]
  
  def index
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_paramas)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end
    
  


  private

  def furima_paramas
    params.require(:furima).permit(:product, :content, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :time_required_id, :image).merge(user_id: current_user.id)
  end


  

end

  