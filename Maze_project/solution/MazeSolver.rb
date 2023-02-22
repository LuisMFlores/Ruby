require "byebug"
require_relative "./Maze.rb"
require_relative "./TileNode.rb"

class MazeSolver

    ORTHAGONAL_DELTAS = [[0,1], [1,0], [0,-1], [-1,0]]
    DIAGONAL_DELTAS = [[1,1], [-1, -1], [1,-1], [-1,1]]

    def initialize(maze)
        @maze = maze
        reset_values
    end

    def path(point)
        path_arr = []
        spot = point
        unless @branch_path[spot].nil?
            new_spot = @branch_path[spot]
            path_arr << new_spot
            spot = new_spot
        end
        path_arr
    end

    def calculate_manhattan(point)
        g = find_path(@maze.start_ind).length
        h = Math.sqrt((point.x - @maze.end_ind.x).abs + (point.y - @maze.end_ind.y).abs)

        f = g + h

        if point.f == 0 || f < point.f
            point.update(g,h)
        end

        point.f

    end

    def manhattan_heuristic(queue)
        queue.inject do |current_point, next_point|
            c_f = calculate_manhattan(current_point)
            n_f = calculate_manhattan(next_point)

            c_f < n_f ? current_point : next_point
        end
    end

    def build_braching_paths(heuristic = :manhattan_heuristic)
        open_queue = [@current]
        closed_queue = []

        until open_queue.empty? || @current == @maze.end_ind
            @current = self.send(heuristic,open_queue)
            open_queue.delete(@current)
            closed_queue << @current
            neighboors = @maze.find_neighboors(@current, ORTHAGONAL_DELTAS + DIAGONAL_DELTAS)

            neighboors.each do |neighboor|
                unless open_queue.include?(neighboor) || closed_queue.include?(neighboor)
                    open_queue << neighboor
                    @branch_path[neighboor] = @current
                end
            end
        end

        debugger
        @branch_path
    end

    def find_path(goal = @maze.find_end)
      path = [goal]
      spot = goal
      until @branch_path[spot] == nil
        path << @branch_path[spot] 
        spot = @branch_path[spot]
      end
      path
    end

    def solve
        build_braching_paths
        @maze.show_path(find_path)
    end

    def reset_values
        @current = @maze.start_ind
        @branch_path = {}
    end

end

maze = Maze.new("maze1.txt")
solver= MazeSolver.new(maze)
solver.solve