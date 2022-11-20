# Enumerables

require "byebug"

puts [2,4,6,7,13,21,100].all? { |el| el.even? } # false
puts [3, 9, 15].all? { |el| !el.even? } # true

puts [1,2,3,4,5].any? { |el| el > 4 } # true
puts "hello".split("").any? { |el| el.upcase == el } # false

puts [3, 9, 15].none? { |el| el.even? } # true
puts [1,2,3,4,5].none? { |el| el < 2 } # false

puts [1,1,1,4,5].one? { |el| el < 2 } # false
puts [1,2,3,4,5].one? { |el| el == 1 } # true

puts [1,2,3,4,5].count { |el| el.even? } #2
puts "hello".split("").count {|el| el == "l" } #2

puts [1,2,3,4].sum # 10

puts [1,2,3].max # 10
puts [1,2,3].min # 1

p [].min #nil


multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]

# Symbols

str = "hello"
sym = :hello

puts str == sym #false

puts str.object_id
str[0] = "Luima"
puts str
puts str.object_id

puts :hello.object_id # Same object
puts sym.object_id # Sabe object

# Symbols as hash

my_bootcamp = { name: "App Academy", color: "red", location: ["NY", "SF", "ONLINE"] }
puts my_bootcamp[:name]


# Default argument

def great_with(user, message = "Welcome")
    message + " " + user
end

puts great_with("Luis") # Welcome Luis
puts great_with("Luis", "Hello") # Hello Luis

# Option hashes

def some_method(hash)
    hash
end

puts some_method( name: "App Academy", red: "Red" )

def modify_string(str, option = { upper: false, repeats: 21})
    if option[:upper]
        str.upcase * option[:repeats]
    else
        str.downcase * option[:repeats]
    end
end

puts modify_string("hello", upper: true, repeats: 5)

# Splat operator (*)

# * arrays of arguments

def print_method(arg_1, arg_2, *other_args)
    p arg_1
    p arg_2
    p other_args
end

print_method("Hello", "How are you", "a","b","c","d","e")

# * decompose of an array

def greet_splat(first_name, last_name)
    "Welcome #{first_name} #{last_name}!"
end

name_arr = ["Luis", "Flores"]

puts greet_splat(*name_arr)

arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
p [*arr_1,"c",*arr_2]

# ** double splat operator decompose hash

old_hash = { a: 1, b: 2}
new_hash = {**old_hash, c: 3}

puts new_hash

# Inject method

puts [11, 7, 2, 4].inject { |acc, el| acc + el }
puts [11, 7, 2, 4].inject(0) { |acc, el| el.even? ? acc + el : acc }

# Global variables - has global scope

$global_var = "Some var"

# Constant - cannot be reassigned but can be mutated. has global scope

FOOD = "pho"
FOOD[0] = "L"
puts FOOD # "Lho"

# Begin/Rescue

def protecting_divide(num1, num2)

    begin
        num1 / num2    
    rescue => exception
        puts exception
    end
end

protecting_divide(1,0)

# Raising

def full_name(first_name, last_name)
    raise "arguments must be string" if !first_name.instance_of?(String) || !last_name.instance_of?(String)
    "#{first_name} #{last_name}"
end

puts full_name("Luis", "Manuel")

begin
    puts full_name(43, true)
rescue => exception
    puts exception
end

# Blocks

puts str.each_char.map(&:upcase).join("")

# Procs

doubler = Proc.new { |num| num * 2 }
p doubler
p doubler.call(7) # 14
p doubler.call(5) # 10

doubler = Proc.new { |num| num * 2 }
p doubler
p doubler.call(7) # 14
p doubler.call(5) # 10

is_even = Proc.new do |num|
    if num % 2 == 0
        true
    else
        false
    end
end

sum = Proc.new { |num1, num2| num1 + num2 }

p is_even.call(10) # true
p sum.call(2,2) # 

def add_and_proc(num_1, num_2, proc)
    sum = num_1 + num_2
    p proc.call(sum)
end

# --- V1 --- PROC AS ARGUMENTS

add_and_proc(1,4,doubler) # 12

multiplier = Proc.new { |num| num * 2 } # 10

add_and_proc(3, 6, multiplier) # 18

negate = Proc.new { |num| num * -1 }

add_and_proc(1, 6, negate) #-7


# V2 ---- BLOCKS AS ARGUMENTS

def add_and_block(num1, num2, &prc)
    p prc.call(num1 + num2)
end

add_and_block(1,5) { |num| num * 2 } # 12
add_and_block(5,5) { |num| num * -1 } # -10
add_and_block(10,5) { |num| num - 5 } # 10

new_doubler = Proc.new { |num| num * 2 }

def doubler_example(num1 = 1, num2 = 2, &prc)
    p prc.call(num1 + num2)
end

doubler_example(1,5, &new_doubler) # 12
doubler_example(1,6) { |num| num * 2 } # 14

p [1,2,3].map(&new_doubler) # [2,4,6]

# Classes

class Cat

    # Class variable. Can be change
    @@number_of_legs = 4

    # Class constant. Cannot be change
    NUMBER_OF_LEGS = 4

    # Class Method
    def self.change_num_of_legs(num = 0)
        @@number_of_legs = num
    end

    def initialize(name, color ,age)
        @name = name
        @color = color
        @age = age
    end

    # Getter methods

    def name
        @name
    end

    def name=(name)
        @name = name
    end

    def age
        @age
    end

    def age=(age)
        @age = age
    end

end

cat_1 = Cat.new("Sennacy", "Brown", 3)
cat_2 = Cat.new("Whiskers", "Black", 5)

p cat_1
p cat_2

puts cat_1.name # Sennacy
cat_1.name = "Luis"
puts cat_1.name

# Class#method_name means method_name is an instance method
# Class::method_name means method_name is a class method

# Monkey Patching 

 class String
    
    def upcase?
        self.upcase == self
    end

end

puts "HELLO".upcase? # true
puts "hello".upcase? # false

class Integer
    def prime?
        return false if self < 2
        (2...self).none? { |num| self % num == 0 }
    end
end

puts 1.prime? # false
puts 4.prime? # false
puts 15.prime? # false
puts 17.prime? # true

class Array
    def has_zero?
        self.one? { |ele| ele == 0 }
    end
end

p [1,2,3].has_zero? # false
p [0,10,11].has_zero? # true

# IN/OUT

# p "Enter your name"
# name = gets
# p "Your name is #{name.chomp}"

# p "Enter your age"
# age = gets.chomp.to_i
# p "Your age is #{age}"


# attr_reader & attr_writer & attr_accessor

class Dog

    attr_reader :name, :breed
    attr_writer :name, :breed

    def initialize(name, breed)
        @name = name
        @breed = breed
    end

end

dog = Dog.new("Luis", "Labrador")
puts dog.name

# Recursion

def count_down(num)
    if num == 0
        puts "Lift off!"
        return
    end

    puts num

    count_down(num - 1)
end

count_down(10)

# Write a method `factorial(n)` which takes a number and returns the factorial of n.
# A factorial is the product of all whole numbers between 1 and n, inclusive.
# For example, `factorial(5)` is 5 * 4 * 3 * 2 * 1 = 120.

def factorial(n)
    return 1 if n == 1
    n * factorial(n - 1)
end

puts factorial(5)

# Write a method fib(n) that takes in a number and returns the nth number of
# the fibonacci sequence.
# In the fibonacci sequence, the 1st number is 1 and the 2nd number is 1. To generate the
# next number in the sequence, we take the sum of the previous two fibonacci numbers.
# For example the first 5 numbers of the fibonacci sequence are `1, 1, 2, 3, 5`

# Examples:

# fib(1) # => 1
# fib(2) # => 1
# fib(3) # => 2
# fib(4) # => 3
# fib(5) # => 5
# fib(6) # => 8
# fib(7) # => 13

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 1) + fib(n - 2)
end

puts fib(6)