# frozen_string_literal: true

class CertificationsController < ApplicationController
  def show
    @certification = Certification.find(params[:id])
  end

  def new
    @certification = Certification.new
  end

  def create
    @certification = current_user.certifications.build(certification_params)
    if @certification.save
      redirect_to @certification
    else
      render :new
    end
  end

  def edit
    @certification = Certification.find(params[:id])
  end

  def update
    @certification = Certification.find(params[:id])
    if @certification.update(certification_params)
      redirect_to @certification
    else
      render :edit
    end
  end

  def destroy
    @certification = Certification.find(params[:id])
    @user = current_user
    @certification.destroy
    redirect_to @user
  end

  private

  def certification_params
    params.require(:certification).permit(:name, :date_of_acquisition)
  end
end
