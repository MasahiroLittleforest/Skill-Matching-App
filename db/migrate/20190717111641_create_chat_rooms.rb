class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
