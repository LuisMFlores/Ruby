require_relative "Board"
require_relative "Player"
require "byebug"

class MemoryPuzzleGame

    def initialize(name)
        @board = Board.new
        @player = Player.new(name)
        @last_guess = nil
        run
    end

    def run
        welcome_message

        until game_over?
            system("clear")
            @board.render
            guessed_pos
        end

    end

    def game_over?
        @board.cards.flatten.none? { |card| card.hidden == true }
    end

    private 

    def welcome_message
        system("clear")
        puts "-------------------------------"
        puts "|Welcome to Memory-Puzzle-Game|"
        puts "-------------------------------"
        sleep(2)
    end

    def make_guess

    end

    def guessed_pos
        puts
        print "Pick a location to reveal the card: "
        current_guess = @player.prompt.split(",")
        @board.reveal(current_guess)
        @last_guess ||= current_guess
        if @last_guess != current_guess
            sleep(4)
            @board.hide(current_guess, @last_guess)
            @last_guess = nil
        end

    end

end

game = MemoryPuzzleGame.new("Luis")