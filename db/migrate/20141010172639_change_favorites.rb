class ChangeFavorites < ActiveRecord::Migration
  def change
    change_table :favorites do |t|
      t.remove :post
      t.remove :user
    end
  end
end
