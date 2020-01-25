class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :user_followings
  has_many :followings, through: :user_followings, source: :followed

  has_many :user_followers, class_name: :UserFollowing, foreign_key: :followed_id
  has_many :followers, through: :user_followers, source: :user

  has_many :tweets, dependent: :destroy

  def follow(user)
    UserFollowing.where(user_id: id, followed_id: user.id).first_or_create
  end

  def following_tweets
    Tweet.for_users(followings.pluck(:id))
  end
end
