class RecipeIngredient < ActiveRecord::Base
  attr_accessible :recipe_id, :ingredient_id, 
  validates :recipe, :ingredient, :presence => true
  validates_uniqueness_of :recipe_id, :scope => :ingredient_id
  
  belongs_to :recipe, :inverse_of => :recipe_ingredients
  belongs_to :ingredient, :inverse_of => :recipe_ingredients
end
