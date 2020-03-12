class RemoveRoomIdFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :room_id, :string
  end
end
