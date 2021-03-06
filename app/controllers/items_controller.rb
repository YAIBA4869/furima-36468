class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

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
      if @item.user_id == current_user.id && @item.purchase_record.nil?
      else
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
      if item.user_id != current_user.id
         redirect_to root_path
    else
      item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_condition_id, :category_id, :price, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
