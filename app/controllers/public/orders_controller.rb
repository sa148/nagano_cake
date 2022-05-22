class Public::OrdersController < ApplicationController

  def new
    @order = Orede.new(order_params)
    @order.save
    redirect_to confirm_path
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = @address.name
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
