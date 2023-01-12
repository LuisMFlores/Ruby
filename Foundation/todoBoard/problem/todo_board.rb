require "byebug"
require "./list.rb"

class TodoBoard

    def initialize
        @lists = {}
    end

    def run 
        while self.get_command

        end

    end


    def get_command

        puts "Enter a command: "
        cmd, target, *args = gets.chomp.split(" ")

        list = @lists[target]

        case cmd
            
        when "mklist"
            @lists[target] = List.new(target)
        when "ls"
            @lists.keys.each { |key| puts "---#{key}"}
        when "showall"
            @lists.keys.each { |key| @lists[key].print_list }
        when "mktodo"
            list.add_item(*args)
        when "up"
            list.up(*args.map(&:to_i))
        when "down"
            list.down(*args.map(&:to_i))
        when "swap"
            list.swap(*args.map(&:to_i))
        when "sort"
            list.sort_by_date!
        when "priority"
            puts list.print_full_item(0)
        when "print"
            args.empty? ? list.print_list : list.print_full_item(*args.map(&:to_i))
        when "toggle"
            list.toggle_item(*args.map(&:to_i))
        when "rm"
            list.remove_item(*args.map(&:to_i))
        when "purge"
            list.purge
        when "quit"
            return false
        else
            puts "That is not a command"
        end

        true
    end

end

TodoBoard.new.run