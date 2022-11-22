require_relative 'tile.rb'

class Board
    $num = (1..9).to_s

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

    def position(pos ,value)
        @grid[pos].value = value
    end

    def render
        @grid.each {|row| puts row.join(" ")}
    end

    def row?
        @grid.all? {|row| row.all? {|ele| $num.inlude?(ele)}}
    end

    def col?
        @grid.transpose.all? {|row| row.all? {|ele| $num.inlude?(ele)}}
    end

    def square?
        
    end

    def solved?
       row? && col? && square?
    end

end