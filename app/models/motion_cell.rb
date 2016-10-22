class MotionCell < Cell
  belongs_to :destination, class_name: "Cell", foreign_key: "cell_id"

  validates :destination, presence: true

  def act
    players.each do |player|
      player.turn = player.game.turn
      player.cell = destination
      player.cell.act
    end
  end
end
