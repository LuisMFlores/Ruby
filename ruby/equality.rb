require "byebug"

class Cat

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def hash
        self.name.hash
    end

    def eql?(other)
        self.name == other.name
    end

end

cat_1 = Cat.new("Luis")
cat_2 = Cat.new("Luis")

some_hash = {cat_1 => "something" }
puts some_hash[cat_2]