require "byebug"
require "./Player"

class ComputerPlayer < Player

    def get_position(legal_pos)
        super(legal_pos)
        sleep(2)
        sample = legal_pos.sample
        p sample
        sleep(2)
        sample
    end

end