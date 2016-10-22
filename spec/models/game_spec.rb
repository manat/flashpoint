require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:players) }
  it { is_expected.to belong_to(:board) }

  describe "when there is a winner, game ends" do
    it { is_expected.to belong_to(:winner) }
  end

  describe "validations" do
    it { is_expected.to validate_numericality_of(:turn).only_integer.is_greater_than_or_equal_to(0) }
  end
end
