class CreateUserHasFavourites < ActiveRecord::Migration
  def change
    create_table :user_has_favourites do |t|
      t.integer :user_id, index: true
      t.integer :user_favourite_id, index: true
      t.timestamps
    end
    add_index :user_has_favourites, :user_id
    add_index :user_has_favourites, :user_favourite_id
  end
end
