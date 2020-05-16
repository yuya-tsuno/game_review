class Favorite < ApplicationRecord
  belongs_to :game, foreign_key: :game_id
  belongs_to :user, foreign_key: :user_id
end
