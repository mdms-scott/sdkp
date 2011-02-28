class UsersController < ApplicationController
  

  
  def new
    @user = User.new
    @title = "Create Admin Account"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Created new admin account."
      redirect_to root_url
    else
      @title = "Create Admin Account"
      render "new"
    end
  end
  

end
