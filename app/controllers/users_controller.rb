class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報を更新できませんでした。'
      render :edit
    end
  end

  def destory
    @user = User.find(params[:id])
    @user.destory
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :first_name, :middle_name, :last_name, :birthday, :bio, :image)
    end
end
