require "byebug"

def element_count(arr)
    hash = Hash.new(0)
    arr.each { |el| hash[el] += 1 }
    hash
end

def char_replace!(str, hash)
    (0...str.length).each { |idx| str[idx] = hash[str[idx]] if hash.has_key?(str[idx]) }
    str
end

def product_inject(nums)
    debugger
    nums.inject { |acc, el| acc * el }
end