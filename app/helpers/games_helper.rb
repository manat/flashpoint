module GamesHelper
  def title(game, current_player)
    res = "Game ID #{game.id} "
    if current_player.present?
      res += " | Player: #{current_player.name}"
    end
    res
  end
end
