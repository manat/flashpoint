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
end
