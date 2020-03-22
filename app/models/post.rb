class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end


    #いいねされた時の通知メソッド
    def create_notification_favorite!(current_user)
    	#いいねされているか検索
    	temp = Notification.where(["visetor_id = ? and visited_id = ? and action = ?",current_user.id, user_id, 'favorite'])
    	#いいねされていない場合、レコードを作成する条件分岐(tempの中が空の場合true)
    	if temp.blank?
    		notification = current_user.active_notifications.new(
    			post_id: id,
    			visited_id: user_id,
    			action: 'favorite'
    			)

    		if notification.visetor_id == notification.visited_id
    			notification.checked = true
    		end
    		notification.save if notification.valid?
    	end
    end

    #コメントされた時の通知メソッド
    def create_notification_comment!(current_user, comment_id)
    	#PostCommentモデルからcurrent_user以外のuser_idとpost_idを見つける。
    	temp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    	temp_ids.each do |temp_id|
    		save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    	end

    	save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
    	#コメントは複数回行うため、１つの投稿に対して複数回通知する
    	notification = current_user.active_notifications.new(
    		post_id: id,
    		comment_id: comment_id,
    		visited_id: visited_id,
    		action: 'comment'
    		)
    	#自分に対するコメントは通知済み
    	if notification.visetor_id == notification.visited_id
    		notification.checked = true
    	end
    	notification.save if notification.valid?
    end



    validates :impression,presence: true,length: {maximum: 150}
end
