class DetentionCell < Cell
  validates :turn, numericality: { only_integer: true, greater_than: 0 }

  def act
    players.each do |player|
      player.turn = player.game.turn + self.turn
    end
  end
end
