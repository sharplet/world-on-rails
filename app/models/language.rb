class Language < ActiveRecord::Base
  has_many :spoken_languages
  has_many :countries, :through => :spoken_languages
end
