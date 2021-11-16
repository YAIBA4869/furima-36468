class ItemsController < ApplicationController
  # def index
  #   # @articles = Article.order("created_at DESC")
  # end

  def index
    @items = Item.includes(:user)
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :price, :shipping_charges_id, :product_condition_id, :shipping_area_id, :days_to_ship_id, :prefecture_id, :category_id, :user,  :image).merge(user_id: current_user.id)
  end
end
