class CreateTeachersPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers_preferences do |t|
      t.references :teacher, foreign_key: true
      t.float :students_rate
      t.integer :min_age
      t.integer :max_age
      t.string :gender
      t.references :prefecture
      t.time :lesson_time

      t.timestamps
    end
  end
end
