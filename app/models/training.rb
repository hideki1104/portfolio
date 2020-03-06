class Training < ApplicationRecord
	has_many :conduct_trainings, dependent: :destroy
	belongs_to :genre
	has_many :training_records, dependent: :destroy
end
