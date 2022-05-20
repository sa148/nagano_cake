class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = Customer.find_by(params[:email])
  end

  def update
     @customer = Customer.find_by(params[:email])
     @customer.update(customer_params)
     redirect_to public_customers_path
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = customer.find_by(email: params[:email])
    @customers.update(is_valid: false)
    reset_session
    redirect_to homes_top_path
  end

end
