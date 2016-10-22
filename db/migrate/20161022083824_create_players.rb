class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name, null: false, unique: true
      t.references :cell, foreign_key: true
      t.integer :turn

      t.timestamps
    end
  end
end
