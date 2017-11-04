class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.password == params[:session][:password]
      @user = user
      login_successful
    else
      flash[:message] = "That Login was unsuccessful"
      redirect_to login_path
    end
  end

  def oauth_login
    User.from_omniauth(request.env["omniauth.auth"])
  end

  def destroy
    session.clear
    redirect_to root_path
  end

    private

  def login_successful
    session[:user_id] = @user.id
    flash[:notice] = "Logged in as #{@user.first_name} #{@user.last_name}"
    redirect_to root_path
  end

end
