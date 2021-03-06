class RelationshipsController < ApplicationController

before_action :authenticate_user!
	def follow
		current_user.follow(params[:id])
		User.find(params[:id]).create_notification_follow!(current_user)
		redirect_to user_posts_path
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_to user_posts_path
	end
end