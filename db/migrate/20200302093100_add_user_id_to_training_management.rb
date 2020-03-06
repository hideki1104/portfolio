class AddUserIdToTrainingManagement < ActiveRecord::Migration[5.2]
  def change
    add_column :training_managements, :user_id, :integer
  end
end
