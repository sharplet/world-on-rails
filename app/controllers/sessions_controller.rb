class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:id])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_profile_path(session[:user_id])
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end
end
