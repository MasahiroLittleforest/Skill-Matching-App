# frozen_string_literal: true

class TeachersController < ApplicationController
  def index; end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def create
    @tacher = current_user.build_teacher(teacher_params)
    if @teacher.save
      flash[:success] = 'Activated your Teacher account!'
      redirect_to @teacher
    else
      flash[:danger] = 'Failed to activate your Teacher account.'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update
      flash[:success] = 'Updated your Teacher account profile!'
      redirect_to @teacher
    else
      flash[:danger] = 'Failed to update.'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    flash[:success] = 'Deleted your Teacher account!'
    redirect_to root_url
  end

  private

  def teacher_params
    params.require(:teacher).permit(:user_id, :bio, :rate)
  end
end
