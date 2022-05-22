class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def  item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
