require "byebug"

class Array
    def my_each(&prc)
        (0...self.length).each { |idx| prc.call(self[idx]) }
        self
    end
end

# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:
 # calls my_each twice on the array, printing all the numbers twice.

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
     2
     3
     1
     2
     3

p return_value  # => [1, 2, 3]

# My Select

class Array
    def my_select(&prc)
        my_select_arr = []
        my_each do |el|
            my_select_arr << el if prc.call(el)
        end
        my_select_arr
    end
end

# Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!

# Example:

a = [1, 2, 3]
a.my_select { |num| num > 1 } # => [2, 3]
a.my_select { |num| num == 4 } # => []
 
# My Reject
class Array 

    def my_reject(&prc)
        new_arr = []
        my_each { |el| new_arr << el if !prc.call(el)}
        new_arr
    end

end

# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

# Example:

a = [1, 2, 3]
a.my_reject { |num| num > 1 } # => [1]
a.my_reject { |num| num == 4 } # => [1, 2, 3]

class Array
    def my_any?(&prc)
        my_select { |el| return true if prc.call(el) }
        false
    end

    def my_all?(&prc)
        my_select do |el| 
            return false if !prc.call(el)
        end
        true
    end
end

# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

# Example:

a = [1, 2, 3]
a.my_any? { |num| num > 0 } # => true
a.my_any? { |num| num == 4 } # => false
a.my_all? { |num| num > 0 } # => true
a.my_all? { |num| num < 4 } # => true

class Array
    def my_flatten
        flatten_arr = []
        my_select do |el|
            if el.is_a?(Array)
                flatten_arr += el.my_flatten
            else
                flatten_arr << el
            end
        end
        flatten_arr
    end
end

# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

class Array
    def my_zip(*elements)
        zipped_arr = []
        each.with_index do |ele, idx|
            eles_arr = [ele]
            elements.my_each do |elements_ele|
                eles_arr << elements_ele[idx]
            end
            zipped_arr << eles_arr
        end
        zipped_arr
    end
end

# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


class Array
    def my_rotate(num = 1)
        new_arr = self.dup
        if num > 0
            num.times { new_arr.append(new_arr.shift)}
        else  
            (num * -1).times { new_arr.unshift(new_arr.pop) }
        end
        new_arr
    end
end

# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.

a = [ "a", "b", "c", "d" ]
a.my_rotate         #=> ["b", "c", "d", "a"]
a.my_rotate(2)      #=> ["c", "d", "a", "b"]
a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a.my_rotate(15)     #=> ["d", "a", "b", "c"]

class Array
    def my_join(separator = "")
        new_str = ""
        each.with_index do |ele, idx|
            if idx != self.length - 1
                new_str += ele + separator
            else
                new_str += ele
            end
        end
        new_str
    end
end
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.



a = [ "a", "b", "c", "d" ]
a.my_join         # => "abcd"
a.my_join("$")    # => "a$b$c$d"


class Array
    def my_reverse
        reverse_arr = []
        idx = self.length - 1
        while idx >= 0
            reverse_arr << self[idx]
            idx -= 1
        end
        reverse_arr
    end
end

# Write a method that returns a new array containing all the elements of the original array in reverse order.

[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]