FactoryGirl.define do
  factory :cell do
    trait :base do
      name :origin
      association :board, :base
    end
  end
end