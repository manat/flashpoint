class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_player
    Player.find_by_id(cookies.signed[:player_id])
  end
end
