class Training < ApplicationRecord
	has_many :conduct_trainings, dependent: :destroy
	belongs_to :genre
	has_many :training_records, dependent: :destroy
	validates :training_name,presence: true
	validates :youtube_url,presence: true
	validates :description,presence: true
	validates :number_time,presence: true
end