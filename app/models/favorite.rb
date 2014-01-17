class Favorite < ActiveRecord::Base
  attr_accessible :recipe_id, :user_id
  validates :recipe_id, :user_id, :presence => true
  validates_uniqueness_of :recipe_id, :scope => :user_id
  
  belongs_to :recipe
  belongs_to :user
end
