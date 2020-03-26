class Room < ApplicationRecord
	 has_many :entries,dependent: :destroy
	 has_many :messages,dependent: :destroy
	 has_many :notifications, dependent: :destroy

	 #メッセージ通知メソッド
    def create_notification_message!(current_user, message_id, user_id)
        save_notification_message!(current_user, message_id,user_id)
    end

    def save_notification_message!(current_user, message_id, visited_id)
      #メッセージは複数回行うため、１つの投稿に対して複数回通知する
      notification = current_user.active_notifications.new(
        room_id: id,
        message_id: message_id,
        visited_id: visited_id,
        action: 'message'
        )
      #自分に対するコメントは通知済み
      if notification.visetor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
end