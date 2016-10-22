FactoryGirl.define do
  factory :motion_cell do
    trait :forward do
      name :forward
      association :destination, factory: :cell, name: :origin
    end
  end
end