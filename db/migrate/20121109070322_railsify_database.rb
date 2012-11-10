class RailsifyDatabase < ActiveRecord::Migration
  def change
    rename_table :country, :countries
    rename_column :countries, :Code, :id
    rename_column :countries, :Name, :name
    rename_column :countries, :Continent, :continent
    rename_column :countries, :Region, :region
    rename_column :countries, :SurfaceArea, :surface_area
    rename_column :countries, :IndepYear, :year_of_independence
    rename_column :countries, :Population, :population
    rename_column :countries, :LifeExpectancy, :life_expectancy
    rename_column :countries, :GNP, :gnp
    rename_column :countries, :LocalName, :local_name
    rename_column :countries, :GovernmentForm, :form_of_government
    rename_column :countries, :HeadOfState, :head_of_state
    rename_column :countries, :Capital, :capital
    rename_column :countries, :InternetCode, :internet_code

    rename_table :city, :cities
    rename_column :cities, :ID, :id
    rename_column :cities, :Name, :name
    rename_column :cities, :CountryCode, :country_id
    rename_column :cities, :District, :district
    rename_column :cities, :Population, :population

    rename_table :countrylanguage, :languages
    rename_column :languages, :CountryCode, :country_id
    rename_column :languages, :Language, :language
    rename_column :languages, :IsOfficial, :is_official
    rename_column :languages, :Percentage, :percentage_speakers
  end
end
