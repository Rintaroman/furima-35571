class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] 
  before_action :set_furima, only: [:show, :edit, :update]
  before_action :set_edit, only: [:edit, :update,]
  
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
  end

  def edit
  end

  def update
    if @furima.update(furima_paramas)
      redirect_to furima_path(@furima.id)
    else
      render :edit
    end
  end

  def destroy
    furima = Furima.find(params[:id])
    if user_signed_in? && current_user.id == furima.user_id
    furima.destroy
    redirect_to root_path    
    end
  end


  private
params.require(:furima).permit(:product, :content, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :time_required_id, :image).merge(user_id: current_user.id)
  def furima_paramas
    
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def set_edit
    unless @furima.user_id == current_user.id
      redirect_to root_path
    end
  end
  

end

  