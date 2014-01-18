class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!
      redirect_to root_url
    else
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end
  end
  
  def destroy
    logout!
    redirect_to root_url
  end
end
