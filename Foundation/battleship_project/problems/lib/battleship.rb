require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(board_length)
        @player = Player.new()
        @board = Board.new(board_length)
        @remaining_misses = self.board.size / 2
    end

    def start_game
        self.board.place_random_ships
        print self.board.num_ships
        self.board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        end

        false
    end

    def win?
        if self.board.num_ships < 1
            print "you win"
            return true
        end
        false
    end

    def game_over?
        win? || lose?
    end

    def turn
        move = self.player.get_move
        if !self.board.attack(move)
            @remaining_misses -= 1
        end

        self.board.print

        puts "remaining misses - #{@remaining_misses}"
    end

end
