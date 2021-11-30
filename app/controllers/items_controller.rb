class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  # def index
  #   # @items = Item.includes(:user)
  #   @items = Item.all
  # end

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
  def article_params
    params.require(:article).permit(:text,:genre_id)
  end
end
