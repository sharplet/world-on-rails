class CountriesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      # TODO: Convert DataTable presentation this to use the exhibit pattern
      format.json { render :json => CountryDataTable.new(view_context) }
    end
  end
end
