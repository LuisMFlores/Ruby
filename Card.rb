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
        @hidden = false
    end

    def ==(card)
        card.value == value
    end

end