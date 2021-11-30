class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def index
    @items = Item.includes(:user)
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

    #   @item = Item.find(params[:item_id])
    # if @item.save
    #   redirect_to room_messages_path(@room)
    # else
    #   render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:shipping_area_id, :product_name, :product_description, :product_condition_id, :category_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  
  end
end
