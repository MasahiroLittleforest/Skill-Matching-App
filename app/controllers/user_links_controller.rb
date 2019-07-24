# frozen_string_literal: true

class UserLinksController < ApplicationController
  def show
    @user_link = UserLink.find(params[:id])
  end

  def new
    @user_link = UserLink.new
  end

  def create
    @user_link = current_user.user_links.build(user_link_params)
    if @user_link.save
      redirect_to @user_link
    else
      render :new
    end
  end

  def edit
    @user_link = UserLink.find(params[:id])
  end

  def update
    @user_link = UserLink.find(params[:id])
    if @user_link.update(user_link_params)
      redirect_to @user_link
    else
      render :edit
    end
  end

  def destroy
    @user_link = UserLink.find(params[:id])
    @user = @user_link.user
    @user_link.destroy
    redirect_to @user
  end

  private

  def user_link_params
    params.require(:user_link).permit(:name, :url)
  end
end
