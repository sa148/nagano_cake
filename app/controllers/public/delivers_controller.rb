class Public::DeliversController < ApplicationController
  def create
    @deliver = Deliver.new(deliver_params)
    @deliver.customer_id = current_customer.id
    @deliver.save
    redirect_to public_delivers_path
  end

  def index
    @deliver = Deliver.new
    @delivers = current_customer.delivers.all
  end

  def edit
    @deliver = Deliver.find(params[:id])
  end

  def update
    @deliver = Deliver.find(params[:id])
    @deliver.update(deliver_params)
    redirect_to public_delivers_path
  end

  def destroy
    @deliver = Deliver.find(params[:id])
    @deliver.destroy
    redirect_to public_customers_path
  end

  private

  def  deliver_params
    params.require(:deliver).permit(:customer_id, :name, :postal_code, :address)
  end
end
