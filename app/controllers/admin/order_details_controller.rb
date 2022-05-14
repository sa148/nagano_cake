class Admin::OrderDetailsController < ApplicationController

  def index
    @orede_detail = @orede_details.all
  end

  def update
  end

end
