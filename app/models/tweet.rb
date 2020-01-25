class Tweet < ApplicationRecord
  validates :body, presence: true

  belongs_to :user

  scope :for_users, lambda { |user_ids|
    where(user_id: user_ids)
  }
end
