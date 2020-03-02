class CreateTrainingManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :training_managements do |t|

      t.timestamps
    end
  end
end
