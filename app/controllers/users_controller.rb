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
    if @user.update
      flash[:success] = '更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = '更新できませんでした。'
      render :edit
    end
  end

  def destory
    @user = User.find(params[:id])
    @user.destory
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_url
  end
end
