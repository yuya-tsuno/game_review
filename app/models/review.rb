class Review < ApplicationRecord
  validates :direction, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :operability, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :story, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :volume, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :like, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :summary, presence: true
  validates :body, presence: true, length: { minimum: 5 }
  validates :game_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :game, foreign_key: :game_id
  belongs_to :user, foreign_key: :user_id
end
