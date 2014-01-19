class UsersController < ApplicationController  
  def new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save!
      login!
      render :json => { :status => :ok }
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end
end
