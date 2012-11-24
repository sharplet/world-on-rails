class Country < ActiveRecord::Base
  has_many :cities
  has_one :capital, :class_name => 'City'
  has_many :spoken_languages
  has_many :languages, :through => :spoken_languages
  has_many :watched_countries
  has_many :users, :through => :watched_countries
end
