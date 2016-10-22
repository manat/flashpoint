require 'rails_helper'

RSpec.describe MotionCell, type: :model do
  it { is_expected.to belong_to(:destination) } 
  it { is_expected.to validate_presence_of(:destination) }
  
  it "has destination as another MotionCell" do
    basic_cell = Cell.new(name: 'Basic cell')
    another_motion_cell = MotionCell.new(name: 'To stop', destination: basic_cell)
    cell = MotionCell.new(name: 'You are to move further', destination: another_motion_cell, board: Board.new)

    expect(cell).to be_valid
    expect(cell.destination).to be(another_motion_cell)
    expect(another_motion_cell.destination).to be(basic_cell)
  end  
end
