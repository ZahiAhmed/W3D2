require_relative "Board"

class Game

    attr_reader :player
    
    def initialize(player, size)
        @board = Board.new(size)
        @player = player
        @previous_guess = nil
    end

    def play
        while !@board.won?
            @previous_guess = self.make_guess
            if self.make_guess != @previous_guess
                

    end

    def previous_guess
        @previous_guess
    end

    def over

    end

    def prompt

    end

    def make_guess
        @board.reveal(@player.get_input)
    end



end