# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def counts(user)
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[
      user_name
      email
      password
      password_confirmation
      real_name
      image
      age
      gender
      profession
      bio
      birthday
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
