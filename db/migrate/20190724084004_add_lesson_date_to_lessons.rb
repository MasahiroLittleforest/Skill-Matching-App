class AddLessonDateToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :lesson_date, :date
  end
end
