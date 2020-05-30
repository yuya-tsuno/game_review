class Relationship < ApplicationRecord
  validates :follower_id, presence: true, uniqueness: { scope: [:followed_id] }
  validates :followed_id, presence: true
  validate :follower_user_must_be_different_followed_user  

  def follower_user_must_be_different_followed_user
    if follower_id == followed_id
      error_msg = "自身をフォローすることはできません。"
      errors.add(:relationship, error_msg)
    end
  end

  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
end
