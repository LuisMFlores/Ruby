require "byebug"
require "./item.rb"

class List

    LINE_WIDTH = 48

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")

        begin
            @items << Item.new(title, deadline, description)
        rescue => exception
            return false
        end

        self.print_list
        true

    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index > @items.length - 1
        true
    end

    def swap(index_1, index_2)
        return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        self.print_list
    end

    def [](index)
        self.valid_index?(index) ? @items[index] : nil
    end

    def priority
        self[0]
    end

    def print_list
        puts "-" * LINE_WIDTH
        puts "".ljust(12," ") + self.label + "".ljust(12," ")
        puts "-" * LINE_WIDTH
        puts "Index".ljust(6," ") + " | " + "Item".ljust(15," ") + " | " + "Deadline".ljust(6," ") + " | " + "Done".ljust(6, " ")
        puts "-" * LINE_WIDTH

        @items.each_with_index do |item, idx|
            puts "#{idx}".ljust(6, " ") + " | " + "#{item.title}".ljust(15, " ") + " | " + "#{item.dateline}".ljust(6, " ") + " | " + "[#{item.done ? "✓" : " "}]"
        end
    end

    def print_full_item(index)
        if self.valid_index?(index)
            item = self[index]
            puts "-" * LINE_WIDTH
            formatting_space = LINE_WIDTH - item.title.length - item.dateline.length / 1.5
            puts "#{item.title}".ljust(formatting_space, " ") + "#{item.dateline}"
            puts "#{item.description}"
            puts "-" * LINE_WIDTH
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)

        return false if !self.valid_index?(index)

        move_to = index - amount
        move_to < 0 ? move_to = 0 : move_to 
        @items.insert(move_to, @items.delete_at(index))
        true
    end

        def down(index, amount = 1)

        return false if !self.valid_index?(index)

        move_to = amount - index
        move_to > @items.length - 1 ? move_to = @items.length - 1 : move_to 
        @items.insert(move_to, @items.delete_at(index))
        true
    end

    def sort_by_date!
        @items.sort_by!(&:dateline)
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items = @items.select { |item| !item.done }
    end

end

