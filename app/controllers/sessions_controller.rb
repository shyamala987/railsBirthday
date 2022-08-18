class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render json: { message: "Logged in!" }, status: 200
    else
      render json: { error: "Login attempt failed. Try again." }, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Logged out successfully." }, status: 200
  end
end
