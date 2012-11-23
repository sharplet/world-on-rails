class LanguagesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @spoken_languages = @country.spoken_languages
  end
end
