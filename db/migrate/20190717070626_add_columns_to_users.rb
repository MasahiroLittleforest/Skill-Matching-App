class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :real_name, :string
    add_column :users, :user_name, :string
    add_column :users, :image, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :profession, :string
  end
end
