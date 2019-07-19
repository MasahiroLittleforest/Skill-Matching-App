class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :teacher, foreign_key: true
      t.string :title
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
