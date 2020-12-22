class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  TAX = 1.08

  protected

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      root_path(resource)
    else
      admins_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope) # ログアウト後に遷移
     if resource_or_scope == :customer
      root_path
    else
      new_admin_session_path
    end
  end



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
