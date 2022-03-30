require "byebug"

def factorial(n)
    return 1 if n == 0
    n * factorial(n-1)
end

def reverse_str(str)
    return "" if str == ""
    str[-1] + reverse_sent(str[0...-1])
end

def upcase(str)
    return "" if str == ""
    str[0].upcase + upcase(str[1..-1])
end

def reverse(str)
    return "" if str == ""
    reverse(str[1..-1]) + str[0]
end

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot_arr = [arr.first]
    puts arr[1..-1]
    left_side = arr[1..-1].select { |el| el < arr.first }
    right_side = arr[1..-1].select { |el| el >= arr.first }
    quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

class Array

    def quick_sort
        return self.dup if self.length <= 1
        pivot_el = self.first
        left_side = self.drop(1).select { |el| el < pivot_el }
        right_side = self.drop(1).select { |el| el >= pivot_el }
        left_side.quick_sort + [pivot_el] + right_side.quick_sort
    end

end

# Recursion Homework

def sum_to(n)
    return n if n == 0
    return nil if n < 1
    n + sum_to(n-1)
end

# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

  # Test Cases
  puts sum_to(5)  # => returns 15
  puts sum_to(1)  # => returns 1
  puts sum_to(9)  # => returns 45
  puts sum_to(-8)  # => returns nil

  def add_numbers(nums)
    return 0 if nums.empty?
    nums.pop + add_numbers(nums)
  end

# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

  # Test Cases
  puts add_numbers([1,2,3,4]) # => returns 10
  puts add_numbers([3]) # => returns 3
  puts add_numbers([-80,34,7]) # => returns -39
  puts add_numbers([]) # => returns nil

  
#   Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1
    (n - 1) * gamma_fnc(n - 1)
end

  # Test Cases x
  puts gamma_fnc(0)  # => returns nil
  puts gamma_fnc(1)  # => returns 1
  puts gamma_fnc(4)  # => returns 6
  puts gamma_fnc(8)  # => returns 5040

# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

def ice_cream_shop(available_flavors, favorite_flavor)
    return false if available_flavors.empty?
    return true if available_flavors.pop == favorite_flavor
    ice_cream_shop(available_flavors, favorite_flavor)
end

  # Test Cases
  puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  puts ice_cream_shop([], 'honey lavender')  # => returns false


# Write a function reverse(string) that takes in a string and returns it reversed.

def reverse(str)
    return str if str.empty?
    reverse(str[1..-1]) + str.chars.first
end

  # Test Cases
  puts reverse("house") # => "esuoh"
  puts reverse("dog") # => "god"
  puts reverse("atom") # => "mota"
  puts reverse("q") # => "q"
  puts reverse("id") # => "di"
  puts reverse("") # => ""

  # Recursion exercise

  # Warmup

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start_num, end_num)
  return [] if end_num < start_num
  [start_num] + range(start_num + 1, end_num)
end

def exponation(b, p)
  p == 0 ? 1 : b * exponation(b, p - 1)
end

class Array
  def deep_dup
    dup_arr = []
    self.each { |el| dup_arr << el.is_a?(Array) ? el.deep_dup : el }
    dup_arr
  end
end

def fibonacci(n)
  return [0,1].take(n) if n < 3
  fibs = fibonacci(n - 1)
  fibs << fibs[-2] + fibs[-1]
end

def bsearch(arr, target)
  return nil if arr.empty?

  mid_idx = arr.length / 2

  case target <=> arr[mid_idx]
  when -1
    bsearch(arr.take(mid_idx), target)
  when 0
    mid_idx
  when 1
    subs = bsearch(arr.drop(mid_idx + 1), target)
    subs.nil? ? nil : mid_idx + subs + 1
  end

end


class Array

  def merge_sort

  end

i

end

def permutations(arr)
    return [arr] if arr.length <= 1

    first = arr.shift
    perms = permutations(arr)
    # debugger
    possible_perms = []

    perms.each do |perm|
        (0..perm.length).each do |idx|
            possible_perms << perm[0...idx] + [first] + perm[idx..-1]
        end
    end

    possible_perms
end


require "byebug"

# Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_arr(arr)
    return 0 if arr.empty?
    arr.pop + sum_arr(arr)
end

puts sum_arr([1,2,3])

# Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.

def search_for_v(arr, v)
    return false if arr.empty?
    return true if arr[-1] == v
    search_for_v(arr[0...-1], v)
end

p search_for_v([1,2,3], 0)

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def count_uns_arr(arr, target)
    return 0 if arr.empty?
    (arr.first == target ? 1 : 0) + count_uns_arr(arr.drop(1), target)
end

p count_uns_arr([1,2,3,1,1], 0)

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def adds_to_12(arr)
    return false if arr.length <= 1
    arr.first + arr[1] == 12 ? true : adds_to_12(arr.drop(1))
end

p adds_to_12([1,6,1,1])

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(arr)
    return true if arr.length <= 1
    arr[0] > arr[1] ? false : sorted?(arr.drop(1))
end

p sorted?([1,2,3,4,5])
p sorted?([4,2,1])

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!

def reverse(str)
    return "" if str.empty?
    str[-1] + reverse(str[0...-1])
end

p reverse("Luima")