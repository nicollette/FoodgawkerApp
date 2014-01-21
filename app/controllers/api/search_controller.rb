class Api::SearchController < ApplicationController
  def index
    p "CATEGORY PARAMS"
    p params[:category_ids]
    p "Keywords PARAMS"
    p params[:keywords]
    # @recipes = Recipe.search_results(params[:keywords], params[:category_ids]).page(params[:page]).per(30)
    # @page_num = params[:page]
    @recipes = Recipe.search_results(params[:keywords], params[:category_ids])
    render :index
  end
end
