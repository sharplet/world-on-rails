class User < ActiveRecord::Base
  attr_accessible :id, :password, :password_confirmation
  has_secure_password
  has_many :watched_countries
  has_many :countries, :through => :watched_countries

  validates :id, :uniqueness => true, :presence => true
  validates :password, :on => :create, :presence => true
end
