class UsersController < ApplicationController  
  def new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save!
      login!
      render :show
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
end
