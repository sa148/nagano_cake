class Public::DeliversController < ApplicationController
  def create
    @deliver = Deliver.new(deliver_params)
    @deliver.save
    redirect_to public_delivers_path
  end

  def index
    @deliver = Deliver.new
    @delivers = Deliver.all
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
    params.require(:deliver).permit(:name, :postal_code, :address, :telephone_number)
  end
end
