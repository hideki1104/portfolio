class Genre < ApplicationRecord
	has_many :trainings, dependent: :destroy
	enum class_status:{有効: 0, 無効: 1}
	validates :genre_name,presence: true
end
