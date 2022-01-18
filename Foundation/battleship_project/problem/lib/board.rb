require "byebug"

class Board

    attr_reader :size

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ") }
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[-1]]
    end

    def []=(p, v)
        @grid[p[0]][p[-1]] = v
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
         if self[pos] == :S
           self[pos] = :H
            puts "You sunk my battleship!"
            return true

         end
        self[pos] = :X
        return false
    end

    def place_random_ships
        percentage = (size * 0.25).to_i
        while self.num_ships < percentage
            col = rand(0...@grid.length)
            row = rand(0...@grid.length)
            self[[col,row]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |col|
                if col == :S
                    :N
                else
                    col
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid) 
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
  
end
