require 'rails_helper'

RSpec.describe DetentionCell, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:turn).only_integer.is_greater_than(0) }

  subject(:game) { build(:game, :base, turn: 0) } 
  subject(:players) { build_list(:player, 5, :base, game: game) } 
  subject(:cell) { build(:detention_cell, turn: 4, players: players) }
  it "increase player turn by its turn" do
    expect { cell.act }.to change { 
        cell.players.map(&:turn) 
      }.by([4] * cell.players.size)
  end
end
