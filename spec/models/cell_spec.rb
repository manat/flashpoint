require 'rails_helper'

RSpec.describe Cell, type: :model do
  it "is valid with valid attributes" do
    expect(Cell.new(name: 'basic')).to be_valid
  end

  it "is not valid without a name" do
    expect(Cell.new).to_not be_valid
  end
end
