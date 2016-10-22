class RenameMotionCellDestination < ActiveRecord::Migration[5.0]
  def change
     rename_column :cells, :destination_id, :cell_id
  end
end
