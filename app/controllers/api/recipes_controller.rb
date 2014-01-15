class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index #jbuilder yo
  end
end
