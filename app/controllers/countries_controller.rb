class CountriesController < ApplicationController
  def index
    @countries = Country.order('continent, name')
  end
end
