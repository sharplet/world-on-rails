class UsersController < ApplicationController
  def show
    if current_user && current_user.id == params[:id]
      @user = User.find(params[:id])
      @countries = @user.countries
      render 'countries/index'
    else
      render :file => "#{Rails.root}/public/401.html", :status => :unauthorized
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => 'Signed up!'
    else
      render 'new'
    end
  end
end
