# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      redirect_to @experience
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      redirect_to @experience
    else
      render :edit
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to root_url
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :description, :date)
  end
end
