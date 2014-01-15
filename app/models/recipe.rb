class Recipe < ActiveRecord::Base
  attr_accessible :title, :blog_url, :description, photo???
          :total_time, :user_id
  validates :title, :blog_url, :user_id, :presence => true
    
  belongs_to :user
end
