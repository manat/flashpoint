FactoryGirl.define do
  factory :game do
    trait :base do
      turn 0
      association :board, :base
    end
  end
end