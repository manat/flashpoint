class CreateCells < ActiveRecord::Migration[5.0]
  def change
    create_table :cells do |t|
      t.string :type
      t.string :name, null: false
      t.text :instruction
      t.references :destination
      t.integer :turn

      t.timestamps
    end
  end
end
