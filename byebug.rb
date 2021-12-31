require "byebug"

def is_prime?(num)
    debugger
    return true if num < 3
    (2...num).each { |el| return false if num % el == 0 }
    true
end

puts is_prime?(9)