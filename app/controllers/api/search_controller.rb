class Api::SearchController < ApplicationController
  def index
    p "KEYWORDS #{params[:keywords]}"
    # Recipe.search_results()
    # @recipes = results
    render "recipes/index"
    
  end
end
