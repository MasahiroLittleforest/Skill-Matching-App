# frozen_string_literal: true

class AddDefaultToPrivateInfos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :private_infos, :real_name_is_open, false
    change_column_default :private_infos, :email_is_open, false
    change_column_default :private_infos, :age_is_open, false
    change_column_default :private_infos, :birthday_is_open, false
    change_column_default :private_infos, :gender_is_open, false
    change_column_default :private_infos, :profession_is_open, false
  end
end
