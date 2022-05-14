class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to customers_path
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdrawal
    @customer = customer.find(params[:id])
    @customers.update(is_valid: false)
    reset_session
    redirect_to homes_top_path
  end

end
