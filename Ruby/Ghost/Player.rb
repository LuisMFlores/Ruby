
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
    end

end