class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password])
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = "Wrong credentials"
      render :new
    end
  end

  def destroy
    @user.reset_session_token!
    session[:session_token] = ""
  end

end
