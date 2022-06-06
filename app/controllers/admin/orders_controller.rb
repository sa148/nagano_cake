class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order.update(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :name, :address, :sipping_fee, :total_payemt, :method_of_payment, :order_status)
  end

end
