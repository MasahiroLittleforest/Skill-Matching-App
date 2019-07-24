class CreateUserLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_links do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
