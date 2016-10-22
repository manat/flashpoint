class Game < ApplicationRecord
  has_many :players
  belongs_to :board
  belongs_to :winner, optional: true, class_name: 'Player', foreign_key: 'player_id'

  validates :turn, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
