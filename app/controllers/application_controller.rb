class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception

  helper_method :current_cart_item

  def current_cart
    if session[:cart_item_id]
      @cart_item = Cartitem.find(session[:cart_item_id])
    else
      @cart_item = Cartitem.create
      session[:cart_item_id] = @cart_item.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end
