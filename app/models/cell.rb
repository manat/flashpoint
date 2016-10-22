class Cell < ApplicationRecord
  scope :plain, -> { where(type: nil) }

  validates :name, presence: true
end
