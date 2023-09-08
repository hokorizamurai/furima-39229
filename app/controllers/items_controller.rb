class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit]
 before_action :set_item, only: [:edit, :show, :update]

  def index
  @items = Item.all.order(created_at: :desc)
  end

  def new
  @item = Item.new
  end

  def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
     render :new
    end
  end

  def show
    
  end

  def edit
    
    unless current_user.id == @item.user_id  
        redirect_to root_path
    end
      
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
     render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
