require "byebug"
require "./Player.rb"
require "./HumanPlayer.rb"
require "./AiPlayer.rb"

class GhostGame

    ALPHABET = ("a".."z").to_a

    def initialize(*players)
        @players = players
        @current_player = @players.first
        @previous_player = nil

        @fragment = ""
        @dictionary = {}
        @losses = Hash.new { |hash, k| hash[k] = 4 }
        load_dictionary
    end

    private def load_dictionary
        File.foreach("GhostGameDictionary.txt") { |line| @dictionary[line.chomp] = 1 }
    end

    def run 
        until self.win?
            self.play_round
        end

        puts "#{@players.first.name} YOU WON THE GAME. Congratulations!"
    end

    def play_round
        take_turn(@current_player)
    end

    def next_player!
        valid_next_player = nil
        until valid_next_player
            @players.rotate!(-1)
            top_player = @players.first
            if top_player != @current_player && @losses[top_player] < 5
                @previous_player = @current_player
                valid_next_player = top_player
            end
        end

        @current_player = valid_next_player
    end

    def get_player_input(player)
        return input = player.guess(@fragment) if player.is_a?(Humanplayer)
        input = player.guess(@fragment, @players.length, @dictionary) if player.is_a?(Aiplayer)
        sleep(1.5)
        print input
        puts
        input
    end

    def take_turn(player)
        print "Player #{player.name} enter a letter: "
        input = self.get_player_input(player)

        until valid_play?(input)
            print "Please enter valid input: "
            input = self.get_player_input(player)
            abort if input == "quit"
        end

        @fragment += input
        self.next_player!

        if self.completed_fragment?
            puts "#{@previous_player.name} you completed the word #{@fragment}. You lost this round!."
            @fragment = ""
            self.remove_player?(@previous_player)
            self.print_players_scores
        else
            self.take_turn(@current_player)
        end

    end

    def print_players_scores
        active_playes = @players.select{ |player| @losses[player] < 5 }
        active_playes.each { |player| puts "Name: #{player.name} | Word Completion: #{self.record(player)}"}
    end

    def remove_player?(player)
        if @losses[player] >= 5
            puts "#{player.name} you have been eliminated!"
            @players.delete(player)
        end
    end

    def completed_fragment?
        if @dictionary.has_key?(@fragment)
            @losses[@previous_player] += 1
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

    def win?
        @losses.values.one? { |v| v < "GHOST".length }
    end

    def losses

    end

    def record(player)
        "GHOST".split("").take(@losses[player]).join("")
    end

end

if $PROGRAM_NAME == __FILE__
  game = GhostGame.new(
    Aiplayer.new("Gizmo"), 
    Aiplayer.new("TI-85"),
    )

  game.run
end