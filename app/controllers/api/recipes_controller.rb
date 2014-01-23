class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.time_ordered.page(params[:page]).per(15)
    @page_num = params[:page]
    render :index
  end
  
  def create
    params[:recipe][:user_id] = current_user.id
    params[:recipe][:title] = params[:recipe][:title].downcase
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      render :show
    else
      # return @recipe in json with errors?
      flash.now[:errors] = @recipe.errors.full_messages
      render :show
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id]);
    render :show
  end
  
  def prevRecipe
    
  end
  
  def nextRecipe
    
  end
end
