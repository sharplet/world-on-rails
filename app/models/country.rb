class Country < ActiveRecord::Base
  has_many :cities
  has_many :spoken_languages
  has_many :languages, :through => :spoken_languages
  has_and_belongs_to_many :users
end
