
class Stack

    def initialize
        underlying_array = []
    end

    def push(el)
        underlying_array.push(el)
        el
    end

    def pop
        underlying_array.pop 
    end

    def peek
        underlying_array.last
    end

    private

  attr_reader :underlying_array

end

class Queue

    def initialize
        @underlying_array = []
    end

    def enqueue(el)
        underlying_array.push(el)
        el
    end

    def dequeue
        underlying_array.shift
    end

    def peek
        underlying_array.first
    end

    private
    
    attr_reader :underlying_array
end

class Map

    def initialize
        @underlying_array = [[]]
    end

    def set(k,v)
        pair_index = underlying_array.index { |pair| pair.first == k }
        pair_index ? underlying_array[pair_index].last = v : underlying_array.push([k,v])
    end

    def get(k)
        underlying_array.each { |pair| return pair if pair.last == k }
        nil
    end

    def delete(k)
        v = get(k)
        underlying_array.reject! { |pair| pair.first == k }
        v
    end

    def show
        deep_dup(underlying_array)
    end

    private

    attr_reader :underlying_array

    def deep_dup
        underlying_array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end