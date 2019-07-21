class RemoveTeacherFromCertifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :certifications, :teacher, foreign_key: true
  end
end
