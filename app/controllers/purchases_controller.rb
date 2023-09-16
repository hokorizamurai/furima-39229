class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchase_item, only: [:index, :create]
  
  def index
      @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    
  def purchase_record_params
      params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :telephone_number, :building_name).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def non_purchase_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
  end
  
end
