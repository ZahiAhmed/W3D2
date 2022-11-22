class Board
    def initialize(size )
        @grid = Array.new(size) {Array.new(size, Card.new)}
        @size = size
        populate
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
        num_pairs = (self.size ** 2) / 2
        cards = Card.shuffled_pairs(num_pairs)

        @grid.each_with_index do |row, row_index|
            row.each_with_index do |spot, col_idx|
                pos = [row_idx, col_idx]
                self[pos] = cards.pop
            end
        end
    end

    



    def render
        @grid.each {|row| puts row.join(" ")}
    end

    def reveal(pos)
        if !@grid[pos].face_up
            @grid[pos].reveal
            return @grid[pos].value
        end
    end

    def won?
        @grid.all? {|row| row.all?{|card| card.reveal?}}
    end 
end