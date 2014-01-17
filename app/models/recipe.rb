class Recipe < ActiveRecord::Base
  attr_accessible :title, :blog_url, :description,
          :total_time, :user_id, :photo, :ingredients,
          :recipe_categories_attributes
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
  
  
  def self.filter_by_categories(categories)
    categories = [2, 3]
    join_statement = categories.map do |category|
      "SELECT
          recipe_categories.recipe_id
        FROM
          recipe_categories
        WHERE
          recipe_categories.category_id = ?"
    end.join("\nINTERSECT\n")
    
    query = <<-SQL
      SELECT
        recipes.*
      FROM 
        recipes
      JOIN
        (#{join_statement}) AS rc
      ON
        recipes.id = rc.recipe_id
    SQL
    sql_params = [query].concat(categories)
    
    results = Recipe.find_by_sql(sql_params)   
  end
  
  def self.filter_by_keyword(keywords)
    
  end
end
