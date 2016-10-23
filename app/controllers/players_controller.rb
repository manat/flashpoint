class PlayersController < ApplicationController

  before_action :set_user, only: [:destroy]
  before_action :set_game, only: [:create]

  def create
    @player = Player.new(create_params)
    @player.game = @game
    
    if @player.save
      
      cookies.signed[:player_id] = @player.id
      
      redirect_to @game
    else
      prepare_game_show_page
      render "games/show"
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url
  end

  private
    def prepare_game_show_page
      @players = Player.all.order(:id)
      #hard code board retrieval
      @board = Board.first
    end

    def create_params
      params.require(:player).permit(:name)
    end

    def set_player
      @player = Player.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:game_id])
    end
  
end