require 'rails_helper'

RSpec.describe DetentionCell, type: :model do
  it "is valid with valid attributes" do
    cell = DetentionCell.new(name: 'You are captured', turn: 3)
    expect(cell).to be_valid
  end

  it "is not valid without a turn" do
    cell = DetentionCell.new(name: 'You are captured', turn: nil)
    expect(cell).to_not be_valid
  end

  it "is not valid without a turn greater than 0" do
    cell = DetentionCell.new(name: 'You are captured', turn: 0)
    expect(cell).to_not be_valid
  end
end
