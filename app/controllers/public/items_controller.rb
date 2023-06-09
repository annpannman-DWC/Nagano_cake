class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all

    if params[:word].present?
      if params[:range] == "Genre"
        @items = @items.joins(:genre).where("genres.name LIKE ?", "%#{params[:word]}%")
      elsif params[:range] == "Item"
        @items = @items.where("name LIKE ?", "%#{params[:word]}%")
      end
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end