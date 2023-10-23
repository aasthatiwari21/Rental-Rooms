# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
     def create
      @user = User.find_by_email(user_params[:email])
     if @user && @user.valid_password?(user_params[:password])
       session[:user_id]=@user.id
       sign_in :user, @user
       redirect_to properties_path
     elsif @user && not(@user.valid_password?(user_params[:password]))
       invalid_attempt
     else
       flash[:alert]="Invalid User"
     end
   end



  #  def destroy
  #   debugger
  #   puts "logout clicked"
  #   @user = User.find_by(id: current_user.id)
  #   render :json => { success: "user was successfully deleted" }, :status => 201
  # end
  private

  def user_params

    params.require(:user).permit(:email, :password)
end
end
