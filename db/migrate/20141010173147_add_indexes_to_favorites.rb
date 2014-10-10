class AddIndexesToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :post_id, :integer
    add_index :favorites, :post_id
    add_column :favorites, :user_id, :integer
    add_index :favorites, :user_id
  end
end
