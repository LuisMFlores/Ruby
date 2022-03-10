require_relative "Card.rb"

class Board

    ALPHABET = ("a".."z").to_a

    attr_reader :cards, :grid

    def initialize
        @grid = Array.new(5) { Array.new(5) }
        populate
        render
    end

       def render
        length = @grid.length
        (0...length).each do |out_idx|
            (0...length).each do |in_idx|
                el = grid[out_idx][in_idx]
                if el.kind_of?(Card)
                    print(" #{el.to_s}")
                else
                    print(" #{el}")
                end
            end
            puts
        end
    end

    private

    def populate
        sample = ALPHABET.sample(8) * 2
        shuffle_sample = sample.shuffle

        length = @grid.length
        (0...length).each do |outter_idx|
            (0...length).each do |inner_idx|
                if outter_idx == 0 && inner_idx == 0
                    grid[outter_idx][inner_idx] = " " 
                elsif outter_idx == 0
                     grid[outter_idx][inner_idx] = inner_idx
                elsif inner_idx == 0
                    grid[outter_idx][inner_idx] = outter_idx
                else
                    grid[outter_idx][inner_idx] = Card.new(shuffle_sample.pop)
                end
            end
        end
    end
    
end