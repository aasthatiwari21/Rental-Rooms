class Api::UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  skip_before_action :verify_authenticity_token
  def index
    render json: UserSerializer.new(User.all)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {data: @user, token: @user.generate_jwt}
    else
      render json: {errors: @user.errors.messages}, status: "422"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: {data: @user}, status: 200
    else
      render json: {errors: @user.errors.messages}, status: 422
    end
  end

  def destroy
    debugger
    @user =User.find(params[:id])
    @user.destroy
    render json: {data: @user} ,status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: UserSerializer.new(@user, { params: {user: @user} })
  end

  
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :contact, :city, :role_id)
  end
end