class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:notification] = "Logged in."
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash.now[:alert] = "Username or password doesn't match"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
