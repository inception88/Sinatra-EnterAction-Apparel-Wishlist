class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
