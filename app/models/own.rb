class Own < ApplicationRecord
  validates :game_id, presence: true, uniqueness: { scope: [:user_id] }
  validates :user_id, presence: true
  
  belongs_to :game, foreign_key: :game_id
  belongs_to :user, foreign_key: :user_id
end
