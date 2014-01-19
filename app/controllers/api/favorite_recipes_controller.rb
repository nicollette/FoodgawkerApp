class Api::FavoriteRecipesController < ApplicationController
  before_filter :authenticate
  
  def index
    @favorite_recipes = current_user.favorite_recipes
    render :index
  end
end
