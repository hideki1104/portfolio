class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex:{男: 0, 女: 1}
  attachment :profile_image
  has_many :conduct_trainings, dependent: :destroy
  has_many :weights, dependent: :destroy
  has_many :training_managements, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # フォロー、フォロワー機能アソシエーション
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

 # DM機能アソシエーション
 has_many :entries,dependent: :destroy
 has_many :messages,dependent: :destroy

    # フォローしていればtrueを返す
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
