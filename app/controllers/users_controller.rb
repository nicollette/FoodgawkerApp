class UsersController < ApplicationController  
  def new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save!
      login!
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
