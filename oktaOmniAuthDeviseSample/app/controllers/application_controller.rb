class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def user_is_logged_in?
    if !!session[:oktastate]
    else
      redirect_to "/login"
    end
  end
end
