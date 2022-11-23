require_relative 'board.rb'
require "byebug"

class Game

    attr_accessor :previous_guess , :guessed_pos
    attr_reader :board

    def self.size
        puts "Enter size"
        size = gets.chomp.to_i
        while size % 2 != 0 || size < 2
            puts "Enter an even number size"
            size = gets.chomp.to_i
        end 
        size
    end
    
    def initialize
        @board = Board.new(Game.size)
        @previous_guess = nil
        @guessed_pos = nil
    end

    def play
        while !@board.won?
            @board.render
            @guessed_pos = make_guess
            @board.reveal(@guessed_pos)
            @previous_guess = make_guess
            @board.reveal(@previous_guess)
            if @board[@previous_guess].value != @board[@guessed_pos].value
                puts "No match"
                sleep(2)
                @board[@previous_guess].flip
                @board[@guessed_pos].flip
            end
            @previous_guess = nil
            @guessed_pos = nil
        end
        @board.render
        puts "You won!"
    end

    def make_guess
        puts "Pick a card"
        position = gets.chomp.split.map{|n| n.to_i}
        while !@board.valid_position?(position)
            @board.render
            puts "Pick a valid position"
            position = gets.chomp.split.map{|n| n.to_i}
        end
        position
    end
end

b = Game.new.play