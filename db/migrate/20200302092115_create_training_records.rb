class CreateTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :training_records do |t|
      t.integer :training_management_id
      t.integer :training_id
      t.integer :set_count

      t.timestamps
    end
  end
end
