# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# Get divisors of both numbers

def get_divisors(num)
    (2..num).select { |factor| num % factor == 0 }
end

def coprime?(num_1, num_2)
    num_1_divisors = get_divisors(num_1)
    num_2_divisors = get_divisors(num_2)
    return false if num_1_divisors.any? { |ele| num_2_divisors.include?(ele) }
    return false if num_2_divisors.any? { |ele| num_1_divisors.include?(ele) }
    true

end

# check that the only common advisor between both is 1
p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
