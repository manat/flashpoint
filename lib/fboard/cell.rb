module FBoard

  class Cell

    ICON_PREFIX = "angle-"

    NORMAL_WIDTH = 1
    EVENT_WIDTH = 2


    attr_accessor :index
    attr_accessor :width
    attr_accessor :color
    attr_accessor :direction
    attr_accessor :offset

    def initialize(bcell)
      @bcell = bcell

      self.index = determine_index
      self.width = determine_width
      self.color = determine_color
    end

    def icon_name
      ICON_PREFIX + self.direction
    end

    def determine_index
      @bcell.i
    end

    def determine_width
      @bcell.has_event ? Cell::EVENT_WIDTH: Cell::NORMAL_WIDTH
    end

    def determine_color
      return (@bcell.has_event) ? "success":"info"
    end

  end

end