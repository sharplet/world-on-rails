class CountriesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @countries = @user.countries.order('continent','name')
    else
      @countries = Country.order('continent, name')
    end
  end

  def show
    @country = Country.find(params[:id])
  end
end
