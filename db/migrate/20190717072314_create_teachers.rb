class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.float :rate

      t.timestamps
    end
  end
end
