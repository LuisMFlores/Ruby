class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        @occupants.length >= @capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(guess)
        if !self.full?
            @occupants << guess
            return true
        end
        false
    end
  
end