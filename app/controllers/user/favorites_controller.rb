class User::FavoritesController < ApplicationController
	before_action :authenticate_user!
	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.new(post_id: post.id)
		favorite.save
		if current_user.id == post.user_id
			redirect_to user_post_path(post.id)
		else
			post.create_notification_favorite!(current_user)
			redirect_to user_post_path(post.id)
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.find_by(post_id: post.id)
		favorite.destroy
		redirect_to user_post_path(post.id)
	end
end
