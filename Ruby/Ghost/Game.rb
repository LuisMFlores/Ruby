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
        @losses = { player_1 => 0, player_2 => 0}
        load_dictionary
    end

    private def load_dictionary
        File.foreach("GhostGameDictionary.txt") { |line| @dictionary[line.chomp] = 1 }
    end

    def play_round
        until self.game_over?
            take_turn(current_player)
        end

        puts "##{@previous_player.name} you lost!. Better luck next time!"
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    def take_turn(player)
        print "Player #{player.name} enter a letter: "
        input = player.guess(@fragment)

        until valid_play?(input)
            print "Please enter valid input: "
            input = player.guess(@fragment)
        end

        @fragment += input
        self.next_player!

        if self.completed_fragment?
            puts "#{@previous_player.name} you lost this round."
            puts "The score is #{@current_player.name}: #{self.record(@current_player)} | #{@previous_player.name}: #{self.record(@previous_player)}"
        else
            self.take_turn(self.current_player)
        end

    end

    def completed_fragment?
        if @dictionary.has_key?(@fragment)
            @losses[@previous_player] += 1
            @fragment = ""
            return true
        end

        false
    end

    def valid_play?(string)
        return false if string == ""
        if string.length > 1
            puts "Enter a character"
            return false
        end
        ALPHABET.include?(string)
        new_frag = @fragment + string
        @dictionary.keys.any? { |key| key.start_with?(new_frag) }
    end

    def game_over?
        @losses.values.any? { |v| v >= "GHOST".length }
    end

    def losses

    end

    def record(player)
        "GHOST".split("").take(@losses[player]).join("")
    end

end

game = GhostGame.new(Player.new("Luis"), Player.new("Gordo"))
game.play_round
