class Public::OrdersController < ApplicationController

  def new
    @cart_items = current_customer.cart_items
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Deliver.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @order = Order.new(order_params)
    @order.order_status = "未入金"
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.total_payemt = @total
    @order.save
      @cart_items.each do |cart_item|
        @order_detail = @order.order_details.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.making_status = "制作中"
        @order_detail.save
        @cart_items.destroy_all
      end
    redirect_to public_orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :name)
  end
end
