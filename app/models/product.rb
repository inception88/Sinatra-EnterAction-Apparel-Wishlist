class Product < ActiveRecord::Base
  has_many :users, through: :wishlists
  has_many :wishlists
end
