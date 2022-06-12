class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
     @customer.update(customer_params)
     redirect_to public_customers_path
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to public_path
  end

  private

  def  customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted, :email)
  end

end
