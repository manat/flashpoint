class Player < ApplicationRecord
  belongs_to :cell, optional: true
  belongs_to :game, optional: true

  validates :name, presence: true, uniqueness: true

  def roll_dice(range = 1..6)
    rand(range)
  end
end