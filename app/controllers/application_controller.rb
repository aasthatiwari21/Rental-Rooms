
class ApplicationController < ActionController::Base

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  #   protected
  #   def configure_permitted_parameters

  #     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role_id, :contact,:city,:password_confirmation)}

 

  #     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}

  #   end
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message

  
end
  require 'stripe'

   Stripe.api_key = 'sk_test_51O2YupSGEzrH4LcszHrWTM5KGMHQsnS1RW4n32BDvqUtbwxcXV2Dc357Xde4PqLUzhHbpPN2awYM5hO0qYla9Lrl00iPuuobIN'



end