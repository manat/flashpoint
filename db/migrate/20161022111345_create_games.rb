class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :board, foreign_key: true, index: true
      t.references :player, foreign_key: true, index: true
      t.integer :turn, null: false, default: 0

      t.timestamps
    end
  end
end
