# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
(0..num).reverse_each { |divisor| return divisor if num % divisor == 0 && is_prime?(divisor)}
end

def is_prime?(num)
    return true if num < 2
    (2...num).each do | factor |
        return false if num % factor == 0
    end
    true
end

# More consicence approach
# def largest_prime_factor(num)
#     num.downto(2) { |factorial| return factorial if num % factorial == 0 && is_prime?(factorial)}
# end

# def is_prime?(num)
#     return true if num < 2
#     (2...num).none? { |el| num % el == 0 }
# end

def unique_chars?(str)
    str_hash = Hash.new(0)
    str.each_char { |char| str_hash[char] += 1 }
    str_hash.values.all? { |el| el == 1 }
end

# This technique would allow the return to happend an earlier stage
# def unique_chars(str)
#     unique_chars = []
#     str.each_char do |char|
#         return false if unique_chars.include?(char)
#         unique_chars << char
#     end
# end

def dupe_indices(arr)
    dupe_hash = Hash.new { |k,v| k[v] = [] }
    arr.each_with_index { |el, idx| dupe_hash[el] << idx }
    dupe_hash.select { |k, v| v.length > 1 }
end

def count_arr(arr)
    hash = Hash.new(0)
    arr.each { |el| hash[el] += 1 }
    hash
end

def ana_array(arr_1, arr_2)
    count_arr(arr_1) == count_arr(arr_2)
end