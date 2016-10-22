FactoryGirl.define do
  factory :player do
    trait :base do
      name 'Simone'
      association :game, :base
    end
  end
end
