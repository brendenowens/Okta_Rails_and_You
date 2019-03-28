class UsersController < ApplicationController
  before_action :user_is_logged_in?
  # before_action :correct_user?, :except => [:index]

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
