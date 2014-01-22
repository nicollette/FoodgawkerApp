class Api::ShareController < ApplicationController
  def index
    user = current_user
    url = params[:url]
    msg = RecipeMailer.share_recipe_email(user, url)
    msg.deliver!
    render :json => { :status => :ok }
  end
end
