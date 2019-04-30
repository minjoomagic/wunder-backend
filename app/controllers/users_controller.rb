class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index]
  # skip_before_action :authorized, only: [:create, :get_user]

  def index
    @users = User.all
    render json: @users
  end

  def create
  @user = User.create(user_params)
  # byebug
    if @user.valid?
      token = JWT.encode({user_id: @user.id}, "secret")
      render json: { user: {username: @user.username}, token: token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end


  def get_user
    token = request.headers["authorization"]
    # byebug
    id = JWT.decode(token, "secret")[0]["user_id"]
    @user = User.find(id)
    if @user.valid?
      # byebug
      render json: { user: {username: @user.username}}
    end
  end

  private

  def user_params
    # byebug
    if params[:auth]
      params.require(:auth.user).permit(:username, :password, :email, :phone_number)
    else
      # byebug
      params.require("user").permit(:username, :password, :email, :phone_number)
    end
  end

end
