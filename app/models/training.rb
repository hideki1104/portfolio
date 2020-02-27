class Training < ApplicationRecord
	has_many :conduct_trainings, dependent: :destroy
	belongs_to :genre
end
