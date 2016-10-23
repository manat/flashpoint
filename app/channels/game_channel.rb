class GameChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "game"
  end

  def unsubscribed
  end

end