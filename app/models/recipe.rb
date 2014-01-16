class Recipe < ActiveRecord::Base
  attr_accessible :title, :blog_url, :description,
          :total_time, :user_id
  validates :title, :blog_url, :user_id, :presence => true
    
  belongs_to :user
  
  has_attached_file :photo, :styles => {
      medium: '336x280>',
      large: '672X560>'
  }
end
