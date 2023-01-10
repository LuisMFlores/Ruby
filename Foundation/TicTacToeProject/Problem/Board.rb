class Board
    
  attr_reader :grid

    EMPTY_MARK = "_"

    def initialize(row = 3, col = 3)
        @grid = Array.new(3) { Array.new(col) }
        self.load_empty_grid
    end

    private def itirate_grid(&proc)
        (0...@grid.length).each do |row|
            (0...@grid[row].length).each do |col|
                pos = [row,col]
                proc.call(pos)
            end
        end
    end

    def load_empty_grid
        itirate_grid { |pos| @grid[pos.first][pos.last] = EMPTY_MARK }
    end

    def fill_grid
        itirate_grid { |pos| @grid[pos.first][pos.last] = :X }
    end

    def []=(pos, v)

        raise "Invalid position" if !self.valid?(pos)
        raise "Position is not empty" if !self.empty?(pos)

        row, col = pos
        @grid[row][col] = v
        puts "Win? #{self.win?(v)}"
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def valid?(pos)
        row, col = pos

        min_row = 0
        min_col = 0

        max_row = self.grid.length - 1
        max_col = self.grid.first.length - 1

        row >= min_row && row <= max_row && col >= min_col && col <= max_col
    end

    def empty?(pos)
        col, row = pos
        grid_val = grid[col][row]
         grid_val == EMPTY_MARK || grid_val.nil?
    end

    def print_grid

        itirate_grid do |pos|
            row, col = pos
            print " | "
            print self[pos]
            if (col + 1)  % @grid.length == 0
                print " | "
                puts
            end
        end

        nil
    end

    def win_row?(mark)
        @grid.any? { |row| row.all? { |el| el == mark } }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all? { |el| el == mark } }
    end

    def win_diagonal?(mark)

        top_left_to_down_right_idxs = [[0,0]]
        bottom_left_to_top_right_idxs = [[@grid.length - 1, 0]]

        grid_length = @grid.length

        while top_left_to_down_right_idxs.length < grid_length
            row, col = top_left_to_down_right_idxs.last
            top_left_to_down_right_idxs << [row + 1, col + 1]
        end

        while bottom_left_to_top_right_idxs.length < grid_length
            row, col = bottom_left_to_top_right_idxs.last
            bottom_left_to_top_right_idxs << [row - 1, col + 1]
        end

        top_left_to_down_right_idxs.all? { |pos| self[pos] == mark } || bottom_left_to_top_right_idxs.all? { |pos| self[pos] == mark}

    end
    
    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        itirate_grid { |pos| return true if self[pos] == EMPTY_MARK }
        false
    end

end