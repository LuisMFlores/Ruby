require "byebug"
require "./Player.rb"

class GhostGame

    ALPHABET = ("a".."z").to_a

    attr_reader :current_player, :previous_player

    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2

        @current_player = @player_1
        @previous_player = @player_2

        @fragment = ""
        @dictionary = {}
        load_dictionary
    end

    private def load_dictionary
        File.foreach("GhostGameDictionary.txt") { |line| @dictionary[line.chomp] = 1 }
    end

    def play_round
        until false
            take_turn(current_player)
            break if self.game_over?
        end
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    def take_turn(player)
        print "Player #{player.name} enter a letter: "
        input = player.guess

        until valid_play?(input)
            print "Please enter valid input: "
            input = player.guess
        end

        @fragment += input
        self.next_player!
    end

    def valid_play?(string)
        ALPHABET.include?(string)
        new_frag = @fragment + string
        @dictionary.keys.any? { |key| key.start_with?(new_frag) }
    end

    def game_over?
        if @dictionary.has_key?(@fragment)
            puts "Its game over for you #{@previous_player.name}!"
            return true
        end
        false
    end

end

game = GhostGame.new(Player.new("Luis"), Player.new("Gordo"))
game.play_round
