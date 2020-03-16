class ConductTraining < ApplicationRecord
	belongs_to :user
	belongs_to :training
    validates :set_count,presence: true
end
