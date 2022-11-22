class Board
    def initialize(size)
        @grid = Array.new(size) {Array.new(size)}
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
end