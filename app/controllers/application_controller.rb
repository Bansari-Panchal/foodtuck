class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
   # before_action :authenticate_user!
   add_flash_types :danger , :info , :warning , :success


    before_action  :configure_permitted_parameters, if: :devise_controller?
 
   protected
 
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email,:phone ,:password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email,:phone ,:password, :password_confirmation, :current_password,:birthdate,:timezone,:image])
   
   end
end
