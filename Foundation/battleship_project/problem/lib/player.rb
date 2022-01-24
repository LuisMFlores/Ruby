class Player
    def get_move
        puts "enter a position"
        gets.chomp.split(" ").map(&:to_i)
    end
end
