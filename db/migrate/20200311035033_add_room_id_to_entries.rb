class AddRoomIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :room_id, :integer
  end
end
