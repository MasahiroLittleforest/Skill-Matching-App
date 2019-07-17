class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.float :rate

      t.timestamps
    end
  end
end
