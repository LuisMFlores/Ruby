require_relative "Card"
require "byebug"

class Board

    ALPHABET = ("a".."z").to_a

    attr_reader :cards, :grid_size

    def initialize(grid_size = 4)
        @grid_size = grid_size
        populate
    end

    def render
        puts
        grid_length = cards.length + 1
        (0...grid_length).each do |outter_idx|
            (0...grid_length).each do |inner_idx|
                v = " "
                if outter_idx == 0
                    v += inner_idx.to_s
                elsif inner_idx == 0
                    v += outter_idx.to_s
                elsif
                    v += @cards[outter_idx - 1][inner_idx - 1].to_s
                end
                print v
            end
            puts
        end
    end

    def [](pos)
        col, row = pos
        cards[col.to_i - 1][row.to_i - 1]
    end

        def reveal(pos)
         self[pos].reveal
         system("clear")
         render
    end

    def hide(*pos)
        pos.each { |el| self[el].flip }
    end

    private

    def populate
        original_card_num = grid_size * 2
        sample = (ALPHABET.sample(original_card_num) * 2).shuffle
        grid_length = original_card_num / 2
        @cards = []

        grid_length.times do |v|
            temp_cards = []
            grid_length.times do |in_v|
                temp_cards << Card.new(sample.pop)
            end
            cards << temp_cards
        end
        
    end


    
end