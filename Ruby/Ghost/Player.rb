
class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        gets.chomp
    end

    def alert_invalid_guess
        puts "That is an invalid input! #{@name}"
    end

end