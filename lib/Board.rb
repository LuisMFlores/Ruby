require "byebug"

class Board

    ALPHABET = ("a".."z").to_a

    attr_reader :grid

    def initialize(size = 5)
        raise "Unable to create a board bigger than #{ALPHABET.count * 2}" unless !(size * size > ALPHABET.count * 2) || !size.even?
        @grid = Array.new(size) { Array.new(size) { "" } }
        draw_labels
        populate(size)
        render_grid
    end

    private

    def loop_thru_grid(&prc)
        length = grid.length
        (0...length).each do |row|
            (0...length).each do |col|
                prc.call(row,col)
            end
        end
    end

    def populate(size)
        playeable_size = size - 1
        shuffle_letters = (ALPHABET.sample((playeable_size * playeable_size) / 2) * 2).shuffle
        loop_thru_grid do |row, col|
            next if row == 0 || col == 0
            grid[row][col] = shuffle_letters.pop
        end
    end

    def render_grid
        length = grid.length
        (0...length).each do |row|
            (0...length).each do |col|
                print(grid[row][col].to_s + " ")
            end
            puts " "
        end
    end

    def draw_labels
        length = grid.length
        loop_thru_grid do |row,col|
            if row == 0 && col == 0
                grid[row][col] = " "
            elsif row == 0
                grid[row][col] = col
            elsif col == 0
                grid[row][col] = row
            end
        end
    end

end

board = Board.new(5)