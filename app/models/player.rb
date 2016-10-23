class Player < ApplicationRecord
  belongs_to :cell, optional: true
  belongs_to :game

  validates :name, presence: true, uniqueness: true

  def roll_dice(range = 1..6)
    rand(range)
  end

  class << self
    def for_game(game)
      where("game_id = ?", game)
    end
  end
end