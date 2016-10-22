FactoryGirl.define do
  factory :cell do
    trait :basic do
      name :origin
      association :board, :base
    end
  end
end