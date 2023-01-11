require "byebug"
require "./Board.rb"
require "./HumanPlayer.rb"
require "./ComputerPlayer.rb"

class Game

    attr_reader :player_1, :player_2, :board, :current_player

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = ComputerPlayer.new(player_2_mark)

        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play

        while self.board.empty_positions?
            self.board.print_grid

            current_player_pos = self.current_player.get_position(self.board.legal_positions)
            self.board[current_player_pos] = current_player.mark

            if self.board.win?(self.current_player.mark)
                self.board.print_grid
                self.win
                break
            else
                switch_turn
            end
        end
    end

    def win
        puts "Player #{self.current_player.mark} have won!!!" 
    end

end

game = Game.new(:X,:O)
game.play