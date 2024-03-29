class Api::AuthenticationController < ApplicationController
  # skip_before_action :authorize_request
  skip_before_action :verify_authenticity_token

  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: {token: token , name: @user.name , email: @user.email , city: @user.city , contact: @user.contact} , status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end