module FC

  class FrontCell

    attr_accessor :i
    attr_accessor :has_event
    attr_accessor :icon_name

    def initialize(i, has_event)
      self.i = i
      self.has_event = has_event
    end

  end

end