class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, :null => false
      t.string :blog_url, :null => false
      t.text :description
      t.integer :total_time
      t.integer :user_id, :null => false
      
      t.timestamps
    end
    
    add_index :recipes, :user_id
    add_index :recipes, :title
  end
end
