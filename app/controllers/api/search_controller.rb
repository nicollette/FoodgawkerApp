class Api::SearchController < ApplicationController
  def index
    p "CATEGORY PARAMS"
    p params[:category_ids]
    p "Keywords PARAMS"
    p params[:keywords]
    @recipes = Recipe.search_results(params[:keywords], params[:category_ids])
    render :index
  end
end
