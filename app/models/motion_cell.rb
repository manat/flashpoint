class MotionCell < Cell
   belongs_to :destination, class_name: "Cell",
                          foreign_key: "destination_id"

  validates :destination, presence: true
end
