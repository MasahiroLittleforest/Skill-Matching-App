# frozen_string_literal: true

class RemoveTeacherFromSkills < ActiveRecord::Migration[5.2]
  def change
    remove_reference :skills, :teacher, foreign_key: true
  end
end
