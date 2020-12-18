class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_cart
  
  def current_cart
    if session[:cart_id]
      @cart_product = CartProduct.find(session[:cart_id])
    else
      @cart_product = CartProduct.create
      session[:cart_id] = @cart_product.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
       :first_name,
       :last_name,
       :first_name,
       :last_name,
       :first_name_kana,
       :last_name_kana,
       :postal_code,
       :address,
       :telephone_number
    ])
  end
end
