class AddFavoritesCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :favorites_count, :integer, :default => 0
  end
end
