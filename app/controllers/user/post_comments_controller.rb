class User::PostCommentsController < ApplicationController

  before_action :authenticate_user!
  def create
  	post = Post.find(params[:post_id])
  	post_comment = current_user.post_comments.new(post_comment_params)
  	post_comment.post_id = post.id
  	post_comment.save
    if post_comment.user_id == post.user_id
      redirect_to user_post_path(post.id)
    else
      post.create_notification_comment!(current_user,post_comment.id)
      redirect_to user_post_path(post.id)
    end
  end

  def edit
  	@post = Post.find(params[:post_id])
  	@post_comment = PostComment.find(params[:id])
  	if current_user.id = @post_comment.user.id
  	else redirect_to user_post(@post.id)
  	end
  end

  def update
  	post = Post.find(params[:post_id])
  	post_comment = PostComment.find(params[:id])
  	post_comment.update(post_comment_params)
  	redirect_to user_post_path(post.id)
  end

  def destroy
 	post = Post.find(params[:post_id])
  	post_comment = PostComment.find(params[:id])
  	post_comment.destroy
  	redirect_to user_post_path(post.id)
  end
     private
  def post_comment_params
		params.require(:post_comment).permit(:user_id,:post_id,:comment)
	end
end
