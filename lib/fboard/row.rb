require 'cell'

module FBoard

  class Row

    COL_COUNT = 12

    attr_accessor :cells

    def initialize
      self.cells = []
    end

    def column_exceed?(col)
      col > COL_COUNT
    end

    def cols_count
      col_count = 0
      self.cells.each do |c|
        col_count += c.width
      end
      col_count
    end

    def last?(cell)
      cell == self.cells.last
    end

    def first?(cell)
      cell == self.cells.first
    end

    def set_cells_direction(row_type)
      
      self.cells.each do |c|
        if row_type == :even
          c.direction = "right"
          c.direction = "down" if last? c
        else
          c.direction = "left"
          c.direction = "down" if first? c
        end
      end

    end

    def set_offset(row_type)
      offset = COL_COUNT - cols_count
      if row_type == :even
        mock_cell = FBoard::Cell.new(FC::FrontCell.new(-1, false))
        mock_cell.width = offset
        self.cells << mock_cell
      else
        self.cells.first.offset = "is-offset-#{offset}"
      end
    end

  end

end