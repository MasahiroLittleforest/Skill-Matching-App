class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
      t.references :teacher, foreign_key: true
      t.string :name
      t.date :date_of_acquisition

      t.timestamps
    end
  end
end
