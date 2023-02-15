class UsersController < ApplicationController
  
  def new
  end

  def create
  end

  def show
    @user = current_user.id
  end

  def account_show
    @user = current_user.id
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
   @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:user_image, :user_name, :introduction))
      redirect_to "/users/profile" 
    else
      render "edit"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:user_image, :user_name, :introduction)
  end
end
