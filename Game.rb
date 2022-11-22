require_relative "Board"

class Game

    attr_reader :player
    
    def initialize(player, size)
        @board = Board.new(size)
        @player = player
        @previous_guess = nil
    end

    def play

    end

    def over

    end

    def render

    end

    def prompt

    end

    def make_guess

    end

end