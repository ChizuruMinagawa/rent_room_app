class UsersController < ApplicationController

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
      flash[:notice] = "ユーザー情報を編集をしました。"
      redirect_to "/users/profile" 
    else
      flash.now[:notice] = "ユーザー情報の編集ができませんでした。"
      render "edit"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:user_image, :user_name, :introduction)
  end
end
