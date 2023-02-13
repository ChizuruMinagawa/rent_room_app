class UsersController < ApplicationController
  
  def new
  end

  def create
  end

  def show
    @user = current_user.id
  end

  def profile_show
    @user = current_user.id
  end

  def edit
    #@user = current_user.id
  end

  def update
    @user = current_user.id
    if @user.update(params.require(:user).permit(:email, :password))
      redirect_to :users
    else
      render "edit"
    end
  end

end
