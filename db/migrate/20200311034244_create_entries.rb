class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :user_id
      t.string :room_id

      t.timestamps
    end
  end
end
