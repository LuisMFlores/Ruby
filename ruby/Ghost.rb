require_relative "player"
require "byebug"

class Ghost
    ALPHABET = ("a".."z").to_s
    MAX_LOSS_COUNT = 5

    def initialize(*players)
        @dictionary = File.readlines("dictionary.txt")
        debugger
        @players = players
    end

end

game = Ghost(nil)