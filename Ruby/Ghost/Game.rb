require "byebug"
require "set"
require_relative "Player.rb"
require_relative "HumanPlayer.rb"
require_relative "AiPlayer.rb"

class GhostGame

    ALPHABET = ("a".."z").to_a
    MAX_LOST_COUNT = "GHOST".length

    def initialize(*players)
        @players = players

        @fragment = ""
        @dictionary = Set.new(File.readlines("GhostGameDictionary.txt").map(&:chomp))
        @losses = Hash.new { |hash, k| hash[k] = 0 }
    end


    def run 
        play_round until game_over?

        puts "#{winner.name} YOU WON THE GAME. Congratulations!"
    end

    def welcome
        system("clear")
        puts "Let's play a round of ghost"
        display_standing
    end

    private

    attr_reader :fragment, :losses, :players, :dictionary

    def game_over?
        remaining_player == 1
    end

    def winner
        (player, _) = @losses.find { |_ , losses| losses < MAX_LOST_COUNT }
        player
    end

    def remaining_player
        @losses.values.count { |v| v < MAX_LOST_COUNT }
    end

    def play_round
        @fragment = ""

        welcome

        until round_over?
            take_turn(current_player)
            next_player!
        end

        update_standing
    end

    def update_standing
        system("clear")
        puts "#{previous_player.name} spelled #{fragment}"
        puts "#{previous_player.name} gets a letter!"
        sleep(2)

        if losses[previous_player] == MAX_LOST_COUNT - 1
            puts "#{previous_player.name} has been eliminated!"
        end

        losses[previous_player] += 1
        display_standing
    end
    
    def display_standing
        puts "Current Standings: "
        players.each { |player| puts "#{player.name}: #{record(player)}"}
        sleep(2)
    end

    def next_player!
        players.rotate!
        players.rotate! until losses[current_player] < MAX_LOST_COUNT
    end

    def current_player
        players.first
    end

    def get_player_input(player)
        return input = player.guess(@fragment) if player.is_a?(Humanplayer)
        input = player.guess(@fragment, @players.length, @dictionary) if player.is_a?(Aiplayer)
        input
    end

    def take_turn(player)
        print "Player #{player.name} enter a letter: "
        input = get_player_input(player)

        until valid_play?(input)
            print "Please enter valid input: "
            input = get_player_input(player)
            abort if input == "quit"
        end

        sleep(1.5) if player.is_a?(Aiplayer)
        add_letter(input)

    end

    def add_letter(letter)
        @fragment += letter
    end

    def print_players_scores
        active_playes = @players.select{ |player| @losses[player] < MAX_LOST_COUNT }
        active_playes.each { |player| puts "Name: #{player.name} | Word Completion: #{self.record(player)}"}
    end

    def remove_player?(player)
        if @losses[player] >= MAX_LOST_COUNT
            puts "#{player.name} you have been eliminated!"
            @players.delete(player)
        end
    end

    def completed_fragment?
        if @dictionary.include?(@fragment)
            @losses[previous_player] += 1
            return true
        end

        false
    end

    def previous_player
        (@players.count - 1).downto(0).each do |i|
            player = @players[i]

            return player if @losses[player] < MAX_LOST_COUNT
        end
    end

    def valid_play?(string)
        return false unless ALPHABET.include?(string)
        new_frag = @fragment + string
        @dictionary.any? { |key| key.start_with?(new_frag) }
    end

    def is_word?(fragment)
        @dictionary.include?(fragment)
    end

    def round_over?
        is_word?(fragment)
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