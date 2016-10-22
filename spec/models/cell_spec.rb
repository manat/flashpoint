require 'rails_helper'

RSpec.describe Cell, type: :model do
  it { is_expected.to have_many(:players) }
  it { is_expected.to belong_to(:board) }
  it { is_expected.to validate_presence_of(:name) }

  it "has a scope plain to retrieve only cell which has no type" do
    motion_cell = create(:motion_cell, :forward)

    expect(Cell.count).to eq(2)
    expect(Cell.plain.count).to eq(1)
  end

  context "5 players are in the same cell" do
    subject(:game) { build(:game, :base, turn: 1) } 
    subject(:players) { build_list(:player, 5, :base, game: game) } 
    subject(:cell) { build(:cell, :base, players: players) }
    
    it "tells a player to increase their turn" do
      expect { cell.act }.to change { 
        cell.players.map(&:turn) 
      }.by([1] * cell.players.size)
    end
  end

  context "there are no players in the cell" do
    subject(:cell) { build(:cell, :base, players: []) }
    
    it "acts as nothing" do
      expect { cell.act() }.to_not change { 
        cell.players.map(&:turn) 
      }
    end
  end
end
