class AddBoardToCell < ActiveRecord::Migration[5.0]
  def change
    add_reference :cells, :board, foreign_key: true
  end
end
