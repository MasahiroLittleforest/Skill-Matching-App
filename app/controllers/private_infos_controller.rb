# frozen_string_literal: true

class PrivateInfosController < ApplicationController
  def show
    @private_info = PrivateInfo.find(params[:id])
  end

  def new
    @private_info = PrivateInfo.new
  end

  def create
    @private_info = current_user.private_info.build(private_info_params)
    if @private_info.save
      redirect_to @private_info
    else
      render :new
    end
  end

  def edit
    @private_info = PrivateInfo.find(params[:id])
  end

  def update
    @private_info = PrivateInfo.find(params[:id])
    if @private_info.update(private_info_params)
      redirect_to @private_info
    else
      render :edit
    end
  end

  def destroy
    @private_info = PrivateInfo.find(params[:id])
    @user = @private_info.user
    @private_info.destroy
    redirect_to @user
  end

  private

  def private_info_params
    params.require(:private_info).permit(
      :real_name_is_open,
      :email_is_open,
      :age_is_open,
      :birthday_is_open,
      :gender_is_open,
      :profession_is_open
    )
  end
end
