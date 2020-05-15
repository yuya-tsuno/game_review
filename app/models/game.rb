class Game < ApplicationRecord
  # has_many :reviews, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :having_games, dependent: :destroy
  # has_many :likes, dependent: :destroy

  # has_many :review_categories, through: :reviews
  # has_many :review_scores, through: :reviews

  # has_many :users, through: :having_games
  # has_many :users, through: :likes
  # has_many :users, through: :comments

  enum genre: { action: 0, action_RPG: 1, RPG: 2, adventure: 3, action_adventure: 4, action_shouting: 5,
  shouting: 6, FPS_TPS: 7, pazzle: 8, simulation: 9, simulation_RPG: 10, 
  racing_action: 11, race: 12, music: 13, battle: 14, sports: 15, others: 16 }
  
  mount_uploader :icon, IconUploader
end