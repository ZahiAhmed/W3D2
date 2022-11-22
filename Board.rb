class Board
    def initialize(size)
        @grid = Array.new(size) {Array.new(size, Card.new)}
        @size = size
    end

    def [](pos)
        row , col = pos
        @grid[pos] 
    end

    def []=(pos, value)
        row , col = pos
        @grid[pos] = value
    end

    def populate
        rand
    end

    def render
        @grid.each {|row| puts row.join(" ")}
    end

    def reveal(pos)
        if !@grid[pos].reveal?
            @grid[pos].reveal
            return @grid[pos].value
        end
    en

    def won?
        @grid.all? {|row| row.all?{|card| card.reveal?}}
    end 
end