class AddGameToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :game, foreign_key: true, index: true
  end
end
