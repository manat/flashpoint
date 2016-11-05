class PlayersController < ApplicationController

  before_action :set_player, only: [:destroy, :roll]
  before_action :set_game, only: [:create, :destroy]

  def create
    @player = Player.new(create_params)
    @player.game = @game
    @player.cell = @game.board.cells.order(:id).first
    
    if @player.save
      cookies.signed[:player_id] = @player.id

      # broadcast player created
      ActionCable.server.broadcast(
        "game",
        operation: "create",
        player_id: @player.id,
        player_name: @player.name
      ) 

      redirect_to game_path(@game)
    else
      prepare_game_show_page
      render "games/show"
    end
  end

  def destroy
    @player.destroy
    cookies.signed[:player_id] = nil

    # broadcast player destroyed
    ActionCable.server.broadcast(
      "game",
      operation: "destroy",
      player_id: @player.id,
      player_name: @player.name
    ) 

    redirect_to game_path(@game)
  end

  def roll
    current_cell = @player.cell_id - 1
    steps = @player.roll_dice
    game = @player.game
    current_player = game.next_player
    game.update_player(@player, steps)

    # Update movement
    ActionCable.server.broadcast(
      "game",
      operation: "update_board",
      player_name: @player.name,
      current_player: current_player, 
      next_player: game.next_player,
      current_cell: current_cell,
      new_cell: @player.cell_id - 1
    ) 

    render json: { game: game.id, player: @player.id, steps: steps }
  end

  private
    def prepare_game_show_page
      @players = Player.for_game(@game).order(:id)
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