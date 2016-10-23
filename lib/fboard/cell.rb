module FBoard

  class Cell

    ICON_PREFIX = "angle-"

    NORMAL_WIDTH = 1
    MOTION_WIDTH = 2
    DETENTION_WIDTH = 2


    attr_accessor :index
    attr_accessor :width
    attr_accessor :color
    attr_accessor :direction
    attr_accessor :offset
    attr_accessor :bcell_id

    def initialize(vars)
      @bcell = vars[:bcell]

      self.index = vars[:index]
      self.width = determine_width
      self.color = determine_color
      self.bcell_id = determine_bcell_id
    end

    def determine_bcell_id
      id = @bcell.present? ? @bcell.id : -1
    end

    def icon_name
      ICON_PREFIX + self.direction
    end

    def determine_width
      rand(1..2)
=begin
      case @bcell.class.name
      when "DetentionCell"
        DETENTION_WIDTH
      when "MotionCell"
        MOTION_WIDTH
      else
        NORMAL_WIDTH
      end
=end
      #@bcell.has_event ? Cell::EVENT_WIDTH: Cell::NORMAL_WIDTH
    end

    def determine_color
      case @bcell.class.name
      when "DetentionCell"
        "danger"
      when "MotionCell"
        "success"
      else
        "info"
      end
      #return (@bcell.has_event) ? "success":"info"
    end

  end

end