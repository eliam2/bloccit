class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :post
      t.string :user

      t.timestamps
    end
    add_index :favorites, :post
    add_index :favorites, :user
  end
end
