class Cell < ApplicationRecord
  scope :plain, -> { where(type: nil) }

  has_many :players

  validates :name, presence: true
end
