require "byebug"

class Player

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Your turn #{self.mark}"
        puts "Type your position and divide using a whitespace: "

        pos = gets.chomp.split(" ")
        raise "Unformatted input!" if pos.length != 2

        pos.map(&:to_i)
    end

end

player = Player.new(:X)
p player.mark
p player.get_position
