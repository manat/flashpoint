class Player < ApplicationRecord
  belongs_to :cell, optional: true

  validates :name, presence: true, uniqueness: true
end
