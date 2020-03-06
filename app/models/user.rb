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
end
