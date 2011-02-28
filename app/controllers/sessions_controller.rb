class SessionsController < ApplicationController
  
  def new
    @title = "Log in"
  end
  
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      sign_in user
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
