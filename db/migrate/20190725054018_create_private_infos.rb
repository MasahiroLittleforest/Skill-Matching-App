class CreatePrivateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :private_infos do |t|
      t.references :user, foreign_key: true
      t.boolean :real_name
      t.boolean :email
      t.boolean :age
      t.boolean :birthday
      t.boolean :gender
      t.boolean :profession

      t.timestamps
    end
  end
end
