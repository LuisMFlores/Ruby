require "byebug"

def is_prime?(num)
    debugger
    (2...num).each { |factor| return false if num % factor == 0 }
    num > 1
end