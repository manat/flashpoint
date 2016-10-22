require 'rails_helper'

RSpec.describe Board, type: :model do
  it { is_expected.to have_many(:cells) }
  it { is_expected.to validate_presence_of(:name) }

  subject(:cells) { build_list(:cell, 10, :base) }
  subject(:board) { create(:board, :base, cells: cells) }
  it "can tell index of cell in O(1)" do
    expect(board.cell_hash[cells[4]]).to eq(4)
  end
end
