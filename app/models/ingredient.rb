class Ingredient < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  has_many :recipe_ingredients, :inverse_of => :ingredient
  has_many :recipes, 
  :through => :recipe_ingredients, 
  :source => :recipe,
  :inverse_of => :ingredients
end
