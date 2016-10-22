class Player < ApplicationRecord
  belongs_to :cell, optional: true
  belongs_to :game

  validates :name, presence: true, uniqueness: true
end
