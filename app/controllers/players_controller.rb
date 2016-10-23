class PlayersController < ApplicationController

  before_action :set_user, only: [:destroy]

  def index
    @players = Player.all.order(:id)
    @player = Player.new

    #hard code board retrieval
    @board = Board.first
  end

  def create
    @player = Player.new(create_params)
    
    if @player.save
      
      cookies.signed[:player_id] = @player.id
      
      redirect_to players_url
    else
      @players = Player.all.order(:id)
      render 'index'
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url
  end

  private
    def create_params
      params.require(:player).permit(:name)
    end

    def set_player
      @player = Player.find(params[:id])
    end
  
end