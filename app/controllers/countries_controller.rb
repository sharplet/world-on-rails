class CountriesController < ApplicationController
  def index
    @countries = Country.order('continent, name')
  end

  def show
    @country = Country.find(params[:id])
  end
end
