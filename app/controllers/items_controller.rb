class ItemsController < ApplicationController
  def index
    # @items = Item.new
    items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_condition_id, :category_id, :price, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
    
  
  end
end
