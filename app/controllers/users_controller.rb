class UsersController < ApplicationController
  before_filter :authenticate, :only => :show
  
  def new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save!
      login!
      # this will go to recipes#index
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
end
