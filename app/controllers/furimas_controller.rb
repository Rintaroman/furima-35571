class FurimasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, ]#:edit, :delete]
  
  def index
    @furimas = Furima.order("created_at DESC")
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
    
  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
  end

  def update
    @furima = Furima.find(params[:id])
    if @furima.update(furima_paramas)
      redirect_to furima_path(@furima.id)
    else
      render :edit
    end
  end


  private

  def furima_paramas
    params.require(:furima).permit(:product, :content, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :time_required_id, :image).merge(user_id: current_user.id)
  end


  

end

  