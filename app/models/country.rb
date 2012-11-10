class Country < ActiveRecord::Base
  has_many :languages
  has_many :cities
end
