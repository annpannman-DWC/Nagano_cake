class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id = @item.genre.id
    
    if @item.save
      flash[:notice] = "#{@item.name}を追加しました"
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "#{@item.name}を編集しました"
      redirect_to admin_item_path(@item.id)
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :caption, :price, :is_active, :genre_id)
  end
end
