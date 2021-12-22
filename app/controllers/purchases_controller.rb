class PurchasesController < ApplicationController
  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def new
    # @purchases_form = PurchasesFrom.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def purchase_params
    # params.permit(:purchase_record_id, :postal_code, :city, :prefecture_id, :addresses, :building, :phone_number).merge(user_id: current_user.id)
    params.permit(:purchase_record_id, :postal_code, :city, :prefecture_id, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)

  end
end
