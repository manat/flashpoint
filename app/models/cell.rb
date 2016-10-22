class Cell < ApplicationRecord
  scope :plain, -> { where(type: nil) }

  has_many :players
  belongs_to :board

  validates :name, presence: true
end
