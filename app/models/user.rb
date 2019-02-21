class User < ActiveRecord::Base
  has_many :wishlists
  has_many :products, through: :wishlists
end
