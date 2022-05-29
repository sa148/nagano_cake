class Public::OrdersController < ApplicationController

  def new
    @cart_item = current_customer.cart_items
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Deliver.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def complete
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
