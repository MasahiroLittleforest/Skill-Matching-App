class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :lesson_date_time
      t.decimal :price

      t.timestamps
    end
  end
end
