class Public::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = current_customer.cart_items
  end

  def update
      if @cart_item.update(cart_item_params)
        redirect_to public_cart_items_path
        flash[:success] = 'カート内の商品を更新しました！'
      end
  end

  def destory
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destory_all
    @customer.cart_items.destroy_all
    redirect_to public_cart_items_path
    flash[:info] = 'カートを空にしました。'
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id,customer_id: @cart_item.customer_id)
    if @current_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to public_cart_items_path
      else
        @carts_items = @customer.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      @current_item.quantity += params[:quantity].to_i
      @current_item.update(cart_item_params)
      redirect_to public_cart_items_path
    end
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

    private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
