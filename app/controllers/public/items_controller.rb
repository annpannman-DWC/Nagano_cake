class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    else
      @items = Item.all
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end