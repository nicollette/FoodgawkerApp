class Api::FavoritesController < ApplicationController
  def create
    params[:favorite][:user_id] = current_user.id
    @favorite = Favorite.create(params[:favorite])
    render :show
  end
  
  def destroy
    favorite = Favorite.find(params[:id]);
    favorite.destroy
    render :json => :status => 200
  end
end
