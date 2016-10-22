require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:cell) } 
  it { is_expected.to belong_to(:game) } 

  describe "validations" do
    subject { build(:player, :base) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
