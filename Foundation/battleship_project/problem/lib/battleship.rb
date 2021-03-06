require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        return true if win? || lose?
        false
    end

    def turn
        @remaining_misses -= 1 if !@board.attack(@player.get_move) 
        board.print
        puts @remaining_misses
    end

end
