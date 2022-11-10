# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

private def prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
    num.downto(2) { |ele| return ele if prime?(ele) && num % ele == 0  }
end

def unique_chars?(str)
    seen_chars = []

    str.each_char do |char|
        return false if seen_chars.include?(char)
        seen_chars << char
    end

    true
end

def dupe_indices(arr)
    dupe_hash = Hash.new { |h,k| h[k] = [] }
    arr.each_with_index { |ele, idx| dupe_hash[ele] << idx }
    dupe_hash.select { |k,v| v.length > 1 }
end

def count_ele(arr)
    hash = Hash.new(0)

    arr.each { |ele| hash[ele] += 1 }

    hash
end

def ana_array(arr1, arr2)
    count_ele(arr1) == count_ele(arr2)
end