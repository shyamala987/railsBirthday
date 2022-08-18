class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: "Sign up successful!" }, status: 200
    else
      render json: {message: "User sign up failed!"}, status: 400
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
