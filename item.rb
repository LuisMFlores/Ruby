require "byebug"

class Item

    attr_reader :dateline
    attr_accessor :title, :description

    def self.valid_date?(date)
        y,m,d = date.split("-")
        
        return false if y.length != 4
        return false if !(1..12).include?(m.to_i)
        return false if !(1..31).include?(d.to_i)

        true
    end

    def initialize(title, dateline, description)
        @title = title
        @description = description

        raise "Wrong format date" if !Item.valid_date?(dateline)

        @dateline = dateline
    end

    def dateline=(date)
        raise "Invalid dateline inputted" if !Item.valid_date?(date)
        @dateline = date
    end

end
