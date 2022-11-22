require_relative 'tile.rb'

class Board

    def self.from_file(file)
        array = []
        File.readlines(file).each do |line|
            subarray = []
            chars = line.chomp.split("")
            chars.each {|char| subarray << Tile.new(char)}
            array << subarray
        end
        array
    end

    def initialize
        @grid = Board.from_file("sudoku.txt")
    end

    

    def render

    end

    def solved?

    end

end