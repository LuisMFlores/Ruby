require "byebug"
require "./list.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def run 
        while self.get_command

        end

    end


    def get_command

        puts "Enter a command: "
        cmd, *args = gets.chomp.split(" ")

        case cmd
            
        when "mktodo"
            @list.add_item(*args)
        when "up"
            @list.up(*args.map(&:to_i))
        when "down"
            @list.down(*args.map(&:to_i))
        when "swap"
            @list.swap(*args.map(&:to_i))
        when "sort"
            @list.sort_by_date!
        when "priority"
            puts @list.print_full_item(0)
        when "print"
            args.empty? ? @list.print_list : @list.print_full_item(*args.map(&:to_i))
        when "quit"
            return false
        else
            puts "That is not a command"
        end

        true
    end

end

board = TodoBoard.new("Groceries")
board.run