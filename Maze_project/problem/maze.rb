require "byebug"

class Maze

    EDGE_SYMBOL = "*"

    def initialize(file_name)
        lines = File.readlines(file_name).map(&:chomp)
        @grid = []
        @path = []
        @wrong_path = []

        lines.each do |line|
            new_line = []
            line.split("").each do |space|
                new_line << space
            end
            @grid << new_line
        end

        @end_point = get_end_point
        get_starting_position
    end

    def run
        until solved?
            valid_move_positions.each do |pos|
                break if move_to(pos)
            end

            if valid_move_positions.none? { |pos| valid_move?([path.last.first + pos.first, path.last.last + pos.last]) } && !path.include?(@end_point)
                wrong_path << path.pop
                self[wrong_path.last] = " "
            end

            sleep(0.15)
            print_maze
        end

    end

    def solved?
        path.include?(@end_point)
    end

    def get_end_point
        (0...grid.length).each do |row|
            (0...grid[row].length).each do |col|
                return [row,col] if grid[row][col] == "E"
            end
        end
        raise "No endpoint found in the maze"
    end

    def move_to(pos)
        new_pos = [path.last.first + pos.first, path.last.last + pos.last]
        return false unless valid_move?(new_pos)
        path << new_pos
        return true if solved?
        self[new_pos] = "X"
        true
    end

    def get_starting_position
        (0...grid.length).each do |row|
            (0...grid[row].length).each do |col|
               if grid[row][col] == "S"
                 path << [row,col]
                 return true
               end
            end
        end

        raise "No starting point found!"
    end

    def valid_move_positions
        [
            [0,1],
            [1,0],
            [0,-1],
            [-1,0]
        ]
    end

    def print_maze
        @grid.each do |row|
            row.each do |col|
                print col
            end
            puts
        end
    end

    def valid_move?(pos)  
        self[pos]!= EDGE_SYMBOL && !path.include?(pos) && !wrong_path.include?(pos)
    end

    private

    attr_reader :grid, :path, :wrong_path, :current_position

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        grid[row][col] = val
    end


end

maze = Maze.new("Maze.txt")
maze.print_maze
puts maze.valid_move?([0,0])
puts maze.valid_move?([1,1])
maze.run