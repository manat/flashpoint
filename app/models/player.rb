class Player < ApplicationRecord
  attr_reader :dice_result

  belongs_to :cell, optional: true
  belongs_to :game, optional: true  

  validates :name, presence: true, uniqueness: true

  def roll_dice(range = 1..6)
    @dice_result = rand(range)
  end

  class << self
    def for_game(game)
      where("game_id = ?", game)
    end
  end
end