require "./Player.rb"
require "byebug"

ALPHABET = ("a".."z").to_a

class String
    def drop(str)
        return self unless self.start_with?(str)
        self.split("").drop(str.length).join("")
    end
end

class Aiplayer < Player

    def guess(fragment, num_of_players, dictionary)
        super(fragment)
        new_frag = ""
        possible_moves = dictionary.select { |key| key.start_with?(fragment) }
        possible_moves.map! { |move| move.drop(fragment) }
        winning_move(fragment, possible_moves, num_of_players, dictionary)
    end

    def winning_move(fragment, possible_moves, num_of_players, dictionary)
        selected_possible_moves = possible_moves.select { |moves| (moves.length - 1 )% num_of_players != 0 && !dictionary.include?(fragment + moves[0]) }
        if selected_possible_moves.empty?
            return possible_moves.sample[0]
        else
            selected_possible_moves.sample[0]
        end
    end

end
