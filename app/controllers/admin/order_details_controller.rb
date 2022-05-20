class Admin::OrderDetailsController < ApplicationController

  def index
    @order_details = @Order_detail.all
  end

  def update
    @order_details = @Order_detail.all
  end

end
