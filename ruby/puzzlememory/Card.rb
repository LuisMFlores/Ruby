require "byebug"

class Card

    attr_reader :value, :hidden

    def initialize(value)
        @value = value
        @hidden = true
    end

    def to_s
        return "_" if hidden
        value 
    end

    def reveal
        flip
    end

    def ==(card)
        card.value == value
    end

    def flip
        if @hidden
            @hidden = false
            return
        end
        @hidden = true
    end

end