class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
      if @cart_item.update(cart_item_params)
        redirect_to public_cart_item_path
        flash[:success] = 'カート内の商品を更新しました！'
      end
  end

  def destroy
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart_item = CartItem.find(params[:item_id])
    @cart_item.item.destroy
    redirect_to public_cart_items_path
  end

  def destory_all
    @customer.cart_items.destroy_all
    redirect_to public_cart_items_path
    flash[:info] = 'カートを空にしました。'
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.update(amount: @cart_item.amount+=params[:cart_item][:amount].to_i)
      redirect_to public_cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer)
  end

end
