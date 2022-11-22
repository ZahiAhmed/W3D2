require "colorize"

class Tile

    attr_reader :value

    def initialize(value)
        @value = value
    end

    def value= (new_value)
        if !self.given?
            @value = new_value
        end
    end

    def to_s
        @value = "#{@value}"
    end

    def color 
        if given?
            self.colorize(:blue)
        else
            self.colorize(:red)
        end
    end

    def given?
        @value == 0
    end

end