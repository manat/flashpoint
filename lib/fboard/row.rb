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

    def set_cells_direction(direction)
      
      self.cells.each do |c|
        case direction
        when :right
           c.direction = "right"
          c.direction = "down" if last? c
        when :left
          c.direction = "left"
          c.direction = "down" if first? c
        when :down_right
          if (self.cells.count > 2) && (c == self.cells.last)
            c.direction =  "left"
          else
            c.direction = "down"
          end
        when :down_left
          if (self.cells.index(c) + 3) == self.cells.count
            c.direction =  "right"
          else
            c.direction = "down"
          end
        end
      end

    end

    def offset
      COL_COUNT - cols_count
    end

    def set_offset(direction)
      if direction == :right
        self.cells << spacer_cell(offset)
      else
        self.cells.first.offset = "is-offset-#{offset}"
      end
    end

    def spacer_cell(width)
      cell =  FBoard::Cell.new(FC::FrontCell.new(-1, false))
      cell.width = width
      return cell
    end

    def build_vertical(side)
      spacer = spacer_cell(offset)
      if side == :right
        self.cells.unshift spacer
      else
        self.cells. << spacer
      end
    end

  end

end