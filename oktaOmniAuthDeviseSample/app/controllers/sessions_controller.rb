class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
    session[:oktastate] = nil
    reset_session
    redirect_to "/login"
  end

  def failure
  end
end
