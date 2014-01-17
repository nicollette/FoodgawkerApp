class Recipe < ActiveRecord::Base
  attr_accessible :title, :blog_url, :description,
          :total_time, :user_id, :photo, :recipe_categories_attributes
  validates :title, :blog_url, :user_id, :presence => true
    
  belongs_to :user
  has_many :recipe_categories, :inverse_of => :recipe, :dependent => :destroy
  has_many :categories, :through => :recipe_categories, :source => :category
  has_many :favorites

  accepts_nested_attributes_for :recipe_categories, :reject_if => :all_blank
  has_attached_file :photo, :styles => {
      medium: '336x280>',
      large: '672X560>'
  }
end
