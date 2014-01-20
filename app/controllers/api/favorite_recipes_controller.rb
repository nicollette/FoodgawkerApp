class Api::FavoriteRecipesController < ApplicationController
  before_filter :authenticate
  
  def index
    @favorite_recipes = 
      current_user.favorite_recipes.page(params[:page]).per(33)
    @page_num = params[:page]
    
    render :index
  end
end
