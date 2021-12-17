class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(created_at: :desc)
    # @items = Item.all
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
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_condition_id, :category_id, :price, :shopping_charges_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
    
  
  end
end
