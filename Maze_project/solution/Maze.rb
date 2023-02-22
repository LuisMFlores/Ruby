require_relative "./Tilenode.rb"

class Maze

    WALL_SYMBOL = "*"

    attr_reader :start_ind, :end_ind

    def initialize(filename)
        @map = load_maze(filename)
        @start_ind = find_start
        @end_ind = find_end
    end

    def show_map(map = @map)
        map.each do |line|
            puts line.map(&:v).join("")
        end
    end

    def show_path(path)
        dup_map = deep_dup(@map)

        path.each do |child_node|
            dup_map[child_node.y][child_node.x].v = "X"
        end

        show_map(dup_map)
    end

    def find_neighboors(point, deltas)
        neighboors = []
        deltas.map do |d_x, d_y|
            new_point = map[point.y + d_y][point.x + d_x]
            neighboors << new_point if is_valid_point?(new_point)
        end
        neighboors
    end

    def find_end
        find_char("E")
    end

    private 

    attr_reader :map

    def load_maze(filename)
        maze = []
        File.readlines(filename).each_with_index do |line,y|
            maze << line.split("").map.each.with_index do |v, x|
                TileNode.new(x, y, v)
            end
        end
        
        maze
    end

    def find_char(char)
        map.each.with_index do |line, y|
            line.each.with_index do |node, x|
                return node if node.v == char
            end
        end
    end

    def find_start
        find_char("S")
    end

    def is_wall?(point)
        map[point.y][point.x].v == WALL_SYMBOL
    end

    def within_bounds?(point)
        lower_bounds = point.x >= 0 && point.y >= 0
        upper_bounds = point.x < map.first.length && point.y < map.length
        lower_bounds && upper_bounds
    end

    def is_valid_point?(point)
        within_bounds?(point) && !is_wall?(point)
    end

    def deep_dup(item)
        unless item.is_a?(Array)
            item.dup
        else
            dup = []
            item.each { |item| dup << deep_dup(item) }
            dup
        end
    end

end