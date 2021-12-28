class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchased_item, only: [:index, :create]

  
  def index
    @purchase_form = PurchaseForm.new
  end

  def new
  end
  
  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def purchase_params
    params.require(:purchase_form).permit(:purchase_record_id, :postal_code, :city, :prefecture_id, 
      :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token], 
        currency: 'jpy' 
      )
  end

  def set_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.purchase_record.present?
  end
end
