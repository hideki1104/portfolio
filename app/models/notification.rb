class Notification < ApplicationRecord
	# defalt_scope -> { order(created_at: :desc)}
	belongs_to :post, optional: true
	belongs_to :comment, optional: true

	belongs_to :visetor, class_name: 'User', foreign_key: 'visetor_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
