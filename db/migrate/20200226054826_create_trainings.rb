class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :genre_id
      t.string :training_name
      t.string :youtube_url
      t.text :description
      t.integer :number_time

      t.timestamps
    end
  end
end
