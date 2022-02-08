class Board

    ALPHABET = ("a".."z")

    def initialize(size = 5)
        @grid = Array.new(size) { Array.new(size) { "" } }
        add_to_grid(ALPHABET.sample(size - 1).shuffle)
    end

    private

    attr_reader :grid

    def add_to_grid(letters)
        length = grid.length - 1
        (0..length).each do |row|
            (0...length).each do |col|

            end
        end
    end

end