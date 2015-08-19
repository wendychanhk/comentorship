class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
   before_action :configure_permitted_parameters, if: :devise_controller?
  unless Rails.env.development?
  	protect_from_forgery with: :exception
  end
 

  protected
  
def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :first_name, :last_name, :city, :country, :company, :position, :picture_url, :intro









    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end


end



