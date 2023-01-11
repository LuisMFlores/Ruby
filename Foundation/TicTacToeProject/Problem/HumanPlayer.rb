require "./Player.rb"

class HumanPlayer < Player

    def get_position(legal_positions)

        super(legal_positions)
        
        pos = gets.chomp.split(" ")
        raise "Unformatted input!" if pos.length != 2
        pos = pos.map(&:to_i)

        if legal_positions.include?(pos)
            return pos
        else
            puts "Invalid entry. Try again!"
            self.get_position(legal_positions)
        end


    end

end
