class ItemsController < ApplicationController
 

  def index
  @items = Item.all.order(created_at: :desc)
  end

  def new
  authenticate_user!
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
    @item = Item.find(params[:id])
  end

  def edit
    authenticate_user!
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id  
        redirect_to root_path
    end
      
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
     render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)


  end
end
