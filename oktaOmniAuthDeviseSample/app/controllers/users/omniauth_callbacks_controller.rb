class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def oktaoauth
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    print(@user)
    if @user.save
      session[:oktastate] = request.env["omniauth.auth"]
      print(@user.oauth_permissions(session[:oktastate]))
    else
      print(@user.errors.full_messages)
    end
    if @user.persisted?
      redirect_to "/users"
    end
  end

  def failure

  end
end
