class Board < ApplicationRecord
  attr_accessor :cell_hash

  has_many :cells, autosave: true, dependent: :delete_all

  validates :name, presence: true

  after_save :generate_cell_hash
  after_find :generate_cell_hash


  private

  def generate_cell_hash
    self.cell_hash = Hash[cells.map.with_index.to_a]
  end
end
