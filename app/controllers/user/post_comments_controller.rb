class User::PostCommentsController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  end

  def edit
  end
end
