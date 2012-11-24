class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password
  validates :username, :uniqueness => true, :presence => true
  validates :password, :on => :create, :presence => true
end
