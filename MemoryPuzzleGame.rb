require_relative "Board"
require_relative "Player"

class MemoryPuzzleGame

    def initialize(name)
        @board = Board.new
        @player = Player.new(name)
        run
    end

    def run
        welcome_message

        until game_over?

        end

    end

    def game_over?
        @board.cards.none { |card| card.hidden == false }
    end

    private 

    def welcome_message
        puts "-------------------------------"
        puts "|Welcome to Memory-Puzzle-Game|"
        puts "-------------------------------"
        puts
    end

end