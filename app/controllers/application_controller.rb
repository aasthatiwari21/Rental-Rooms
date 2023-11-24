class ApplicationController < ActionController::Base
  include JsonWebToken
   # before_action :authorize_request
  # skip_before_action :verify_authenticity_token
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
     case resource.role
     when 'owner', 'broker'
       new_property_path
     when 'seeker'
       properties_path
     else
       root_path
     end
   end

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :contact, :city, :role_id])
  end

   
 end