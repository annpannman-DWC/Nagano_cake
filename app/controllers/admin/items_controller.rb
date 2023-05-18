class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name}を追加しました"
      redirect_to admin_item_path(@item)
    else
      flash[:alert] = "ジャンル名を入力してください"
      redirect_to new_admin_item_path
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
      flash[:alert] = "ジャンル名を入力してください"
      redirect_to edit_admin_item_path(@item)
    end
  end 
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price_without_tax, :sale_status, :category_id)
  end
  
end
