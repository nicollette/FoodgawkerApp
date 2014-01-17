class Api::SearchController < ApplicationController
  def index
    p "KEYWORDS #{params[:keywords]}"
    render "recipes/index"
  end
end
