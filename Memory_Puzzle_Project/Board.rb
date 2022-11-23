require_relative "card.rb"
require "byebug"
class Board
    
    attr_reader :size, :grid
    
    def initialize(size)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    def [](position)
        row , column = position
        @grid[row][column] 
    end

    def []=(position, value)
        row , column = position
        @grid[row][column] = value
    end

    def populate
        num_pairs = (self.size ** 2) / 2
        cards = Card.shuffled_pairs(num_pairs)

        @grid.each_with_index do |row, row_index|
            row.each_with_index do |spot, col_index|
                pos = [row_index, col_index]
                self[pos] = cards.pop
            end
        end
    end

    def render
        system("clear")
        @grid.each {|row| puts row.map {|card| card.display}.join(" ")}
    end

    def reveal(position)
        if !self[position].face_up?
            self[position].flip
        end
        self.render
    end

    def won?
        @grid.all? {|row| row.all?{|card| card.face_up?}}
    end 

    def valid_position?(position)
        row, column = position
        return false if position.length != 2
        return false if 0 > row || row >= @grid.length
        return false if 0 > column || column >= @grid.length
        true
    end
end