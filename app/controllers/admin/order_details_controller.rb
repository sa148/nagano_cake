class Admin::OrderDetailsController < ApplicationController

  def update

  end

  def order_details_params
    params.require(:order_details).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
