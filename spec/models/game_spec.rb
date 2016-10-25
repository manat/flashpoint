require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:players) }
  it { is_expected.to belong_to(:board) }

  describe "when there is a winner, game ends" do
    it { is_expected.to belong_to(:winner) }
  end

  describe "validations" do
    it { is_expected.to validate_numericality_of(:turn).only_integer.is_greater_than_or_equal_to(0) }
  end

  context "game starts anew with 5 players" do
    subject(:cells) { build_list(:cell, 10, :base) } 
    subject(:players) { build_list(:player, 10, :base) }
    subject(:game) { build(:game, :base, players: players) }
    
    it "begins each turn by telling each player to roll dice" do
      game.board.cells = cells
      
      expect { game.begin_turn }.to change { 
        game.players.map(&:cell) 
      }
    end

    it "updates player cell after steps are given" do
      game.board.cells = cells
      player = game.players.first
      game.update_player(player, 3)

      expect(player.cell_id).to eq(3)
    end
  end
end
