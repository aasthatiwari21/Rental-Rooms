# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
# before_action :configure_permitted_parameters

#   # protected
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :contact, :city, :role_id])
#   end

  # def after_sign_up_path_for(resource)
  #    case resource.role
  #    when 'owner', 'broker'
  #      new_property_path
  #    when 'seeker'
  #      properties_path
  #    else
  #      root_path # Default redirection for other roles
  #    end
  #  end

  def new

    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
       if @user.role.name =='Owner'
          redirect_to new_property_path, notice: "User succesfully created!"
        elsif @user.role.name =='Broker'
          redirect_to new_property_path
        else 
          redirect_to properties_path
        end
      else
      render :new
    end
  end

   

  # def edit

  # @user = User.find(@user.id)

  # end

   

   

  # def update

  # @user = User.find(@user.id)

  # @user.update(user_params)

  # sign_in @user

  # redirect_to root_path

  # end

 

  private

  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation, :contact, :city, :role_id)
end
end