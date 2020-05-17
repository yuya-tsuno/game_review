class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :own_users, through: :owns, source: :user
  
  has_many :owns, dependent: :destroy
  has_many :own_users, through: :owns, source: :user

  enum genre: { action: 0, action_RPG: 1, RPG: 2, adventure: 3, action_adventure: 4, action_shouting: 5,
  shouting: 6, FPS_TPS: 7, pazzle: 8, simulation: 9, simulation_RPG: 10, 
  racing_action: 11, race: 12, music: 13, battle: 14, sports: 15, others: 16 }
  
  # ここに自前のスコープを設定？
end