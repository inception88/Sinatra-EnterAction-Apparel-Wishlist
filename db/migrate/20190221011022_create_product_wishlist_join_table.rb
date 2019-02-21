class CreateProductWishlistJoinTable < ActiveRecord::Migration
  def change
    create_table :product_wishlists do |t|
      t.integer :product_id
      t.integer :wishlist_id
    end
  end
end
