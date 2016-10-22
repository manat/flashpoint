require 'rails_helper'

RSpec.describe MotionCell, type: :model do
  basic_cell = Cell.new(name: 'Basic cell')
  it "is valid with valid attributes" do
    cell = MotionCell.new(name: 'You are to move further', destination: basic_cell)
    expect(cell).to be_valid
  end

  it "is not valid without a destination" do
    cell = MotionCell.new(name: 'You are to move further', destination: nil)
    expect(cell).to_not be_valid
  end

  it "has destination as another MotionCell" do
    another_motion_cell = MotionCell.new(name: 'To stop', destination: basic_cell)
    cell = MotionCell.new(name: 'You are to move further', destination: another_motion_cell)

    expect(cell).to be_valid
    expect(cell.destination).to be(another_motion_cell)
    expect(another_motion_cell.destination).to be(basic_cell)
  end  
end
