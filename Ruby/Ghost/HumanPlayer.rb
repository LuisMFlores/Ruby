require "./Player.rb"

class Humanplayer < Player

    def guess(fragment)
        super
        gets.chomp.downcase 
    end

    def alert_invalid_guess(letter)
        puts "#{name}, #{letter} is an invalid move. Try again!"
    end

end