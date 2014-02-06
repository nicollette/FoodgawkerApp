class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!
      render :user
    else
      render :json => { :errors => @user.errors.full_messages }, :status => 422
      # render :json => :user
    end
  end
  
  def destroy
    logout!
    render :json => { :status => :ok }
  end
end
