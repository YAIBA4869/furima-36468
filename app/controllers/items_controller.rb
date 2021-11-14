class ItemsController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
  end
end
