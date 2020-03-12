class RemoveRoomIdFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :room_id, :string
  end
end
