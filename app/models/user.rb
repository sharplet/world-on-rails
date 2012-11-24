class User < ActiveRecord::Base
  attr_accessible :id, :password, :password_confirmation
  has_secure_password
  has_and_belongs_to_many :countries

  validates :id, :uniqueness => true, :presence => true
  validates :password, :on => :create, :presence => true
end
