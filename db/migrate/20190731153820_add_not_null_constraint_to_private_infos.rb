# frozen_string_literal: true

class AddNotNullConstraintToPrivateInfos < ActiveRecord::Migration[5.2]
  def change
    change_column_null :private_infos, :real_name_is_open, false
    change_column_null :private_infos, :email_is_open, false
    change_column_null :private_infos, :age_is_open, false
    change_column_null :private_infos, :birthday_is_open, false
    change_column_null :private_infos, :gender_is_open, false
    change_column_null :private_infos, :profession_is_open, false
  end
end
