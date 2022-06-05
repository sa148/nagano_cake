class Admin::OrdersController < ApplicationController

  def show
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :name, :address, :sipping_fee, :total_payemt, :method_of_payment, :order_status)
  end

end
