class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index #jbuilder yo
  end
  
  def create
    params[:recipe][:user_id] = current_user.id
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      render :create
    else
      # return @recipe in json with errors?
      flash.now[:errors] = @recipe.errors.full_messages
      
    end
  end
end
