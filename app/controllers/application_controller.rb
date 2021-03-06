class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def logged_in?
    !!current_user
  end

  private

    def require_login
      unless logged_in?
        flash[:message] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
end
