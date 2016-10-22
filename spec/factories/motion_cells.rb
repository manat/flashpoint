FactoryGirl.define do
  factory :motion_cell do
    factory :destination_cell, class: Cell do
      name 'destiny'
      association :board, :base
    end

    trait :forward do
      name :forward
      association :destination, factory: :destination_cell
      association :board, :base
    end
  end
end