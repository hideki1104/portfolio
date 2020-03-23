class Room < ApplicationRecord
	 has_many :entries,dependent: :destroy
	 has_many :messages,dependent: :destroy
	 has_many :notifications, dependent: :destroy

	 #メッセージ通知メソッド
    def create_notification_message!(current_user, message_id)
      #messageモデルからcurrent_user以外のuser_idとroom_idを見つける。
      m_temp_ids = Message.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
      m_temp_ids.each do |m_temp_id|
        save_notification_message!(current_user, message_id, m_temp_id['user_id'])
      end

      save_notification_message!(current_user, message_id, user_id) if m_temp_ids.blank?
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