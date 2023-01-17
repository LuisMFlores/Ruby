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

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
    (1...num).select { |i| num % i == 0 }
end

puts factors(20)

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)

    sorted = false

    while !sorted
        sorted = true
        (self.length - 1).times do |i|
            if prc.call(self[i], self[i + 1])
                self[i], self[i + 1] = self[i + 1], self[i]
                sorted = false
            end
        end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
    subs = []
    (0...string.length).each do |i|
        (i...string.length).each do |j|
            if i != j
                subs << string[i..j]
            else
                subs << string[i]
            end
        end
    end
    subs
end

def subwords(word, dictionary)
    substrings(word).select { |sub| dictionary.include?(sub) }
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
    array.map { |el| el * 2 }
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) }
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
    mapped_arr = []
    my_each { |el| mapped_arr << prc.call(el) }
    mapped_arr 
  end

  def my_select(&prc)
    selected_arr = []
    my_each { |el| selected_arr << el if prc.call(el) }
    selected_arr
  end

  def my_inject(&blk)
    acc = nil
    my_each do |el| 
        if  acc.nil?
            acc = el
        else
            acc = blk.call(acc, el)
        end
    end
    acc
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
    strings.my_inject { |acc,el| acc + el }
end
