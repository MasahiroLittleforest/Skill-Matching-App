class CreateStudentsPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :students_preferences do |t|
      t.references :student, foreign_key: true
      t.references :category
      t.references :skill
      t.float :teachers_rate
      t.integer :min_age
      t.integer :max_age
      t.string :gender
      t.references :prefecture
      t.time :lesson_time
      t.decimal :price

      t.timestamps
    end
  end
end
