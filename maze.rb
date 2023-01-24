require "byebug"

module MazeClasses

    class Maze

        DELTAS = [[1,0], [0,1], [-1,0], [0, -1]]
        WALL_SYMBOL = "*"

        attr_reader :start_ind, :end_ind

        def initialize(filename)
            @map = load_map(filename)
            @title = parse_title(filename)
            @start_ind = find_start
            @end_ind = find_end
        end

        def load_map(filename)
            maze = []
            File.open(filename).each_line do |line|
                chars = line.chomp.split("")
                maze << chars
            end
            maze
        end

        def parse_title(filename)
            filename.match(/(.+)\.txt/)[1]
        end

        def to_s
            string = "Maze #{@title}\n"
            @map.each do |line| 
                string << line.join("")
            end
            string
        end

        def find_start
            find_char("S")
        end

        def find_end
            find_char("E")
        end

        def find_char(char)
            @map.each_with_index do |line, y|
                return [line.index(char), y] if line.index(char)
            end
        end

        def is_wall?(point)
            x, y = point
            @map[x][y] == WALL_SYMBOL
        end

        def in_maze?(point)
            x, y = point
            non_negative = (x >= 0) && (y >= 0)
            within_bounds = (x <= @map[0].length) && (y <= @map.length)
            non_negative && within_bounds
        end

        def find_neighbors(point)
            p_x, p_y = point
            neighbors = []
            DELTAS.each do |d_x, d_y|
                neighbor = [(d_x + p_x), (p_y + d_y)]
                neighbors << neighbor unless is_wall?(neighbor) || !in_maze?(neighbor)
            end
            neighbors
        end

        def travel_path(path)
            puts "Traveling path of #{path.inspect}"
            copy_map = deep_dup(@map)
            path.each do |x, y|
                point = copy_map[y][x]
                if point == "X"
                    puts "This path back-tracks to #{x} #{y}"
                elsif point == WALL_SYMBOL
                    puts "This path hits a wall at #{x} #{y}"
                else
                    copy_map[y][x] = "X"
                end
            end
            show_map(copy_map)
        end

        def show_map(map = nil)
            map ||= @map
            map.each do |line|
                puts line.join("")
            end
        end

        private

        def deep_dup(item)
            unless item.class == Array
                item.dup
            else
                dup_arr = []
                item.each { |item| dup_arr << item.dup }
                dup_arr
            end
        end

    end

end

if __FILE__ == $PROGRAM_NAME
    maze = MazeClasses::Maze.new("maze1.txt")
    maze.show_map
    maze.travel_path([[2,6],[3,6],[4,6],[4,5],[2,6]])
end