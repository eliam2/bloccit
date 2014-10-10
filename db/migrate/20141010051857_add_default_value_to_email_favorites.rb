class AddDefaultValueToEmailFavorites < ActiveRecord::Migration
  def change
    change_column :users, :email_favorites, :boolean, default: false
  end
end
