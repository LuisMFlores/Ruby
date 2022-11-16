require_relative "room"

class Hotel

    def initialize(name, rooms_hash)
        @name = name
        @rooms = Hash.new(nil)

        rooms_hash.each { |k,v| @rooms[k] = Room.new(v) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person_name, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(room_name)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k}: #{v.available_space}"
        end
    end
  
end
