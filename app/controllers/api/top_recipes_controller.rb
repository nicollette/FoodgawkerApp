class Api::TopRecipesController < ApplicationController
  def index
    @recipes = Recipe.fav_ordered.page(params[:page]).per(15)
    @page_num = params[:page]
    render :index
  end
end
