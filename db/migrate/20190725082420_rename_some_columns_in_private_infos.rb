# frozen_string_literal: true

class RenameSomeColumnsInPrivateInfos < ActiveRecord::Migration[5.2]
  def change
    rename_column :private_infos, :real_name, :real_name_is_open
    rename_column :private_infos, :email, :email_is_open
    rename_column :private_infos, :age, :age_is_open
    rename_column :private_infos, :birthday, :birthday_is_open
    rename_column :private_infos, :gender, :gender_is_open
    rename_column :private_infos, :profession, :profession_is_open
  end
end
