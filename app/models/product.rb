class Product < ActiveRecord::Base
  has_many :users, through: :wishlists
  has_many :product_wishlists
  has_many :wishlists, through: :product_wishlists
end
