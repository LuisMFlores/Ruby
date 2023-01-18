
class Player

    def initialize(name)
        @name = name
    end

    def name
        @name.capitalize 
    end

    private def prompt(fragment)
        puts "The current fragment is #{fragment}"
        print "Add Letter: "
    end

    def guess(fragment)
        prompt(fragment)
        gets.chomp.downcase
    end

    def alert_invalid_guess(letter)
        puts "#{name}, #{letter} is an invalid move. Try again!"
    end

end