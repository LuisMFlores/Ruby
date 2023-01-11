class Player

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Your turn #{self.mark}"
        puts "Type your position and divide using a whitespace: "
    end

end