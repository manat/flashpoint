FactoryGirl.define do
  factory :board do
    trait :base do
      name :origin
    end

    factory :board_with_cells do
      transient do 
        cells_count 20
      end

      after(:create) do |board, evaluator|
        create_list(:cell, evaluator.cells_count, name: 'hemming', board: board)
      end
    end
  end
end