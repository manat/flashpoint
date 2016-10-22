class Cell < ApplicationRecord
  scope :plain, -> { where(type: nil) }

  has_many :players
  belongs_to :board

  validates :name, presence: true

  def act
    players.each do |player|
      player.turn = player.game.turn
    end
  end
end
