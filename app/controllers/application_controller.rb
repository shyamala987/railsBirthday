class ApplicationController < ActionController::Base
    helper_method :current_user

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def require_user_authentication
        redirect_to "/login" unless current_user.present?
      end
end
