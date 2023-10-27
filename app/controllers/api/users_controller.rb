class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: UserSerializer.new(User.all)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {data: user}
    else
      render json: {errors: user.errors.message}
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {data: user}
    else
      render json: {errors: user.errors.messages}
    end
  end

  def destroy
    user =User.find(params[:id])
    user.destroy
    render json: {data: user}
  end

  def show
    user = User.find_by(id: params[:id])
    render json: UserSerializer.new(user, { params: {user: user} })
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :contact, :city, :role_id)
  end
end