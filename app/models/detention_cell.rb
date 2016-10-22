class DetentionCell < Cell
  validates :turn, numericality: { only_integer: true, greater_than: 0 }
end
