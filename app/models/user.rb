class User < ActiveRecord::Base
  has_many :wishlists
  has_many :products, through: :wishlists
  has_secure_password
  validates_presence_of :name, :email, :password
end
