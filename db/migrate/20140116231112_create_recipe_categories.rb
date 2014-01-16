class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.integer :recipe_id, :null => false
      t.integer :category_id, :null => false
      
      t.timestamps
    end
    
    add_index :recipe_categories, :recipe_id
    add_index :recipe_categories, :category_id
  end
end
