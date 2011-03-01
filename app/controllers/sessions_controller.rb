class SessionsController < ApplicationController
  
  def new
    @title = "Log in"
  end
  
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      sign_in user
      redirect_back_or root_path
    else
      @title = "Log in"
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
