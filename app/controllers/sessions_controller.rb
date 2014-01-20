class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!
      render :user
    else
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end
  end
  
  def destroy
    logout!
    render :json => { :status => :ok }
  end
end
