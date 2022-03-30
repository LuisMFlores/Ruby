require "json"
require "byebug"

class Cat

    def initialize(name)
        @name = name
    end

    def to_json
        {"name" => @name}
    end

end

c = Cat.new("Luis")
puts c.to_json


alphabet = (1..100).to_a.shuffle

class Node

    attr_reader :value, :left_child, :right_child
    attr_writer :left_child, :right_child

    def initialize(value)
        @value = value
    end

    def insert(node, at = :left)
        case at
        when :left
            self.left_child.nil? ? self.left_child = node : self.left_child.insert(node, at)
        when :right
            self.right_child.nil? ? self.right_child = node : self.right_child.insert(node, at)
        end
    end

    def self.dfs(root, prc)
        return root if !root
        prc.call(root)
        dfs(root.left_child, prc)
        dfs(root.right_child, prc)
    end

end
 
root_node = Node.new("Root")

until alphabet.empty?
    root_node.insert(Node.new(alphabet.pop), (rand(2) == 1) ? :right : :left)
end

p root_node
puts "---------------------"

prc = Proc.new { |node| puts node if node.value % 21 == 0 }
Node.dfs(root_node, prc)
