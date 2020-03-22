module User::NotificationsHelper

	def notification_form(notification)
	  @comment = nil
	  @visetor = link_to notification.visetor.name,user_path(notification.visetor)
	  @your_post =  link_to 'あなたの投稿',user_post_path(notification.post_id)

	  case notification.action
	    when "follow" then
	      "#{@visetor}さんがあなたをフォローしました"
	    when "favorite" then
	      "#{@visetor}が#{@your_post}にいいね!しました"
	    when "comment" then
	      @comment = PostComment.find_by(id:notification.comment_id)&.comment
	      "#{@visetor}が#{@your_post}にコメントしました"
	  end
	end
end