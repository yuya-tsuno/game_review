class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :own_users, through: :owns, source: :user
  
  has_many :owns, dependent: :destroy
  has_many :own_users, through: :owns, source: :user

  enum genre: { action: 1, action_RPG: 2, RPG: 3, adventure: 4, action_adventure: 5, shouting: 6, FPS_TPS: 7, 
                pazzle: 8, simulation: 9, racing: 10, music: 11, battle: 12, sports: 13, other: 14 
              }
  
  ransacker :direction_score do
    query = '(SELECT AVG(reviews.direction) FROM reviews WHERE reviews.game_id = game.id GROUP BY reviews.game_id)'
    Arel.sql(query)
  end

  # COLUMN_NAME_SEARCH_MAP = {
  #   "a" => [1],
  #   "b" => [2,3],
  #   "c" => [4,5]
  # }

  # ransacker :column_name_search, formatter: proc { |v| COLUMN_NAME_SEARCH_MAP[v.to_sym] } do |parent|
  #   parent.table[:column_name]
  # end
  
  mount_uploader :icon, IconUploader
end