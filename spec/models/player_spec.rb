require 'rails_helper'

RSpec.describe Player, type: :model do
  it "is valid with valid attributes" do
    expect(Player.new(name: 'Ralph')).to be_valid
  end

  it "has a unique name" do
    simone = create(:player, :base)
    expect { Player.create!(name: simone.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
