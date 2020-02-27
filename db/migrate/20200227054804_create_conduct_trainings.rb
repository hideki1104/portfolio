class CreateConductTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :conduct_trainings do |t|
      t.integer :user_id
      t.integer :training_id
      t.integer :set_count

      t.timestamps
    end
  end
end
