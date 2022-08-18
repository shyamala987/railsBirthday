class ApplicationController < ActionController::API
    include ActionController::Cookies

    helper_method :current_user

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def require_user_authentication
        render json: {message: "You need to login first! Please hit up /login"} unless current_user.present?
      end
end
