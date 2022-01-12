require "byebug"
require_relative "room"

class Hotel

    def initialize(name, rooms_hash)
        @name = name
        @rooms = {}
        rooms_hash.each do |k,value|

            @rooms[k] = Room.new(value)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.keys.include?(name)
    end

    def check_in(name, room_name)
        unless room_exists?(room_name)
            print "sorry, room does not exist" 
            return
        end
        
        if @rooms[room_name].add_occupant(name)
            print("check in successful")
        else
            print("sorry, room is full")
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each { |room_name, room|  puts "#{room_name} : #{room.available_space}" }
    end
  
end
