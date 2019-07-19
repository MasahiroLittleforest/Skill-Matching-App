class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :teacher, foreign_key: true
      t.string :name
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
