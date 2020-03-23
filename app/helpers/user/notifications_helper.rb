module User::NotificationsHelper

	def notification_form(notification)
	  @comment = nil
	  @visetor = link_to notification.visetor.name,user_path(notification.visetor)

	  case notification.action
	    when "follow" then
	      "#{@visetor}さんがあなたをフォローしました。"
	    when "favorite" then
	      @your_post =  link_to 'あなたの投稿',user_post_path(notification.post_id)
	      "#{@visetor}さんが#{@your_post}にいいね!しました。"
	    when "comment" then
	      @your_post =  link_to 'あなたの投稿',user_post_path(notification.post_id)
	      @comment = PostComment.find_by(id:notification.comment_id)&.comment
	      "#{@visetor}さんが#{@your_post}にコメントしました。"
	    when "message" then
	      @your_room = link_to "メッセージ",user_room_path(notification.room_id)
	      "#{@visetor}さんから#{@your_room}が届きました。"
	  end
	end

	def unchecked_notifications
		@notifications = current_user.passive_notifications.where(checked: false)
	end
end