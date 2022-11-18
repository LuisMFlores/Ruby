require "byebug"

class Board

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ") }
    end

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        max_ships = self.size * 0.25

        while self.num_ships < max_ships
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row,col]
            self[pos] = :S 
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
        Board.print_grid(hidden_ships_grid)
    end


  
end
