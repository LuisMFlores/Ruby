class Array
require "byebug"
    
    
    def my_each(&prc)
        self.length.times do |idx|
            prc.call(self[idx])
        end
        self
    end

    def my_select(&prc)
        select_arr = []
        self.my_each { |el| select_arr << el if prc.call(el) }
        select_arr
    end

    def my_reject(&prc)
        rejected_arr = []
        self.my_each { |el| rejected_arr << el unless prc.call(el) }
        rejected_arr
    end

    def my_any?(&prc)
        self.my_each { |el| return true if prc.call(el) }
        false
    end

    def my_all?(&prc)
        self.my_each { |el| return false unless prc.call(el) }
        true
    end

    def my_flatten
        my_flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                my_flattened.concat(el.my_flatten)
            else
                my_flattened << el
            end
        end

        my_flattened
    end

    def my_zip(*arrays)
        zipped = []

        self.length.times do |i|
            subzip = [self[i]]
            arrays.my_each { |array| subzip << array[i] }
            zipped << subzip
        end

        zipped
    end

  def my_rotate(positions = 1)
    split_idx = positions % self.length
    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = "")
    joined_str = ""
    self.each_with_index do |char, i|
        joined_str += char
        joined_str += separator unless i == self.length - 1
    end
    joined_str
  end

  def my_reverse
    return self if self.length == 1
    [self[-1]].concat(self[0...-1].my_reverse)
  end

end




a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p  [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-9)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

p ["a","b","c","d","e"].my_join("$")

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]