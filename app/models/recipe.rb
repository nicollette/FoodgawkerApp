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
      medium: '275x275#',
      large: '550X550#'
  }
  
  def previous
    if self.id == 1 
      Recipe.last
    else
      Recipe.where("id < ?", self.id).order("id DESC").limit(1).first
    end
  end

  def next
    if self.id == Recipe.last.id
      Recipe.first
    else
      Recipe.where("id > ?", self.id).limit(1).first
    end
  end
  
  def self.time_ordered
    order('id DESC')
  end

  def self.fav_ordered
    order("favorites_count DESC")
  end
  
  def self.search_results(keywords, categories)
    categories ||= []
    parsed_keywords = []
    join_statement = ""
    cat_sql = categories.nil? ? [] : self.generate_category_sql(categories)
  
    if keywords.rstrip.empty? 
      key_sql = ""
      join_statement = cat_sql.join("\nINTERSECT\n")
    else
      parsed_keywords = keywords.split.map { |keyword| "%#{keyword.downcase}%" }
      key_sql = self.generate_keyword_sql(parsed_keywords)
      join_statement = cat_sql.push(key_sql).join("\nINTERSECT\n")
    end
        
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

    sql_params = [query].concat(categories).concat(parsed_keywords)
    results = Recipe.find_by_sql(sql_params)
  end
  
  def self.generate_category_sql(categories)
    join_statement = categories.map do |category|
      "SELECT
          recipe_categories.recipe_id
        FROM
          recipe_categories
        WHERE
          recipe_categories.category_id = ?"
    end
  end
  
  def self.generate_keyword_sql(keywords)
    where_clause = keywords.map do |keyword|
      "title like ?"
    end.join(" AND ")

    join_statement = 
     "SELECT 
        recipes.id AS recipe_id
      FROM 
        recipes
      WHERE 
        #{where_clause}"
  end
end
