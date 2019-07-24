class AddLessonTimeToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :lesson_time, :time
  end
end
