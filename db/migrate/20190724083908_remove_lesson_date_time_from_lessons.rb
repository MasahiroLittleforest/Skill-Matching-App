class RemoveLessonDateTimeFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :lesson_date_time, :datetime
  end
end
