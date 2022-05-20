class Public::DeliversController < ApplicationController
  def create
    @deliver = Deliver.new
    @deliver.save
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
  end

  def destroy
    @deliver = Deliver.find(params[:id])
    @deliver.destroy
    redirect_to customers_path
  end

  def  delive_params
    params.require(:deliver).permit(:name, :postal_code, :address, :telephone_number)
  end
end
