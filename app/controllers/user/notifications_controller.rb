class User::NotificationsController < ApplicationController

	def index
		@notifications = current_user.passive_notifications.paginate(page: params[:page],per_page: 6).order(created_at: :desc)
		@notifications.where(checked: false).each do |notification|
			notification.update_attributes(checked: true)
		end
	end
end
