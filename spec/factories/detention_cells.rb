FactoryGirl.define do
  factory :detention_cell do
    trait :base do
      name :jail
      turn 4
      association :board, :base
    end
  end
end