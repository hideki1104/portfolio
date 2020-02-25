class AddUserInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :height, :float
    add_column :users, :registar_weight, :float
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :profile_image, :string
    add_column :users, :introduction, :text
  end
end
