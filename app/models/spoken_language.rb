class SpokenLanguage < ActiveRecord::Base
  belongs_to :country
  belongs_to :language
end
