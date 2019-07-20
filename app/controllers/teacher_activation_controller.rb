class TeacherActivationsController < ApplicationController
  def create
    current_user.activate_teacher_account
    flash[:success] = 'Activated your Teacher account!'
    redirect_to @user
  end
end
