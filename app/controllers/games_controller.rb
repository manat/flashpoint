class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_current_player, only: [:show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.unfinished.all
    render layout: "application_hero"
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @players = Player.for_game(@game).order(:id)
    @player = Player.new

    #hard code board retrieval
    @board = board
  end

  # GET /games/new
  def new
    @game = Game.new(players: [Player.new])
    
    render layout: "application_hero"
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    # Hard code - board
    # @game.board = Board.first

    respond_to do |format|
      if @game.save
        player = @game.players.first
        # authorize record
        cookies.signed[:player_id] = player.id

        # update player cell, hard-coded board retrieval
        player.cell = board.cells.order(:id).first
        player.save

        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @game = Game.find(params[:game_id])
    # Starts broadcasting that game is started
    ActionCable.server.broadcast(
      "game",
      operation: "start",
      game_id: @game.id,
      current_player_id: @game.current_player.id
    ) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {}).permit(:board_id, players_attributes: [:name])
    end

    def set_current_player
      @current_player = current_player
    end

    def board
      Board.first
    end
end
