# frozen_string_literal: true

class RemoveTeacherFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_reference :experiences, :teacher, foreign_key: true
  end
end
