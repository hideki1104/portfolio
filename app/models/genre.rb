class Genre < ApplicationRecord
	has_many :trainings, dependent: :destroy
	enum class_status:{有効: 0, 無効: 1}
end
