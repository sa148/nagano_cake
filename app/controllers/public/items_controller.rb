class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.all
  end

  def  item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
