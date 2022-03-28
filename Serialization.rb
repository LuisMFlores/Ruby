require "json"

class Cat

    def initialize(name)
        @name = name
    end

    def to_json
        '{"name" => #{@name}}'
    end

end

c = Cat.new("Luis")
p c.to_json

