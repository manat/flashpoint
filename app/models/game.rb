class Game < ApplicationRecord

  MAX_PLAYER = 5

  scope :unfinished, -> { where(winner: nil) }

  has_many :players, autosave: true
  belongs_to :board
  belongs_to :winner, optional: true, class_name: 'Player', foreign_key: 'player_id'

  validates :turn, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :players

  def started?
    turn > 0
  end

  def begin_turn
    players.each do |player| 
      if player.turn == turn
        steps = player.roll_dice

        if player.cell 
          current_index = board.cell_hash[player.cell]
          player.cell = board.cells[current_index + steps]
        else
          player.cell = board.cells[steps - 1]
        end

        save
      elsif player.turn < turn
        raise "#{player.name}'s turn: #{player.turn}, which is less than game's turn: #{turn}"        
      end
    end
  end

  def end_turn
    if players.where({ turn: turn }).count == 0
      self.turn += 1

      # TODO : cell act is probably in the wrong plage
      # board.cells.each do |cell|
      #   cell.act
      # end
      save
    end
  end

  def update_player(player, steps)
    if player.cell 
      current_index = board.cell_hash[player.cell]
      cell_index = current_index + steps
      player.cell = board.cells[cell_index] if cell_index < board.cells.size
    else
      player.cell = board.cells[steps - 1]
    end
    
    player.turn += 1
    players << player

    end_turn
  end

  def current_player
    players.where({ turn: turn }).first
  end

  def current_player_name
    current_player.name if current_player
  end

  def next_player
    players.where({ turn: turn }).second
  end

  def next_player_name
    next_player.name if next_player
  end
end
