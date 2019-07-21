# frozen_string_literal: true

class SkillsController < ApplicationController
  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      redirect_to @skill
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to @skill
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to root_url
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level, :description)
  end
end
