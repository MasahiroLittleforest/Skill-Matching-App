class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :gender, :integer, null: false, default: 0
  end

  def down
    change_column :users, :gender, :string
  end
end
