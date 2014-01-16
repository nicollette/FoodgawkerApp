class RecipeCategory < ActiveRecord::Base
  attr_accessible :recipe_id, :category_id
  validates :recipe, :category_id, :presence => true
  validates_uniqueness_of :recipe_id, :scope => :category_id
  
  belongs_to :recipe, :inverse_of => :recipe_categories
  belongs_to :category
end
