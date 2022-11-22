class Board

    def self.from_file(file)
        file_data = File.("sudoku.txt").readlines.map(&:chomp)
        Array.new(9){Array.new(9 , Tile.new(0))}
    end

    def initialize
        
    end

    

    def render

    end

    def solved?

    end

end