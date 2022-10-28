# Numbers data type

puts 10 / 3 # 3
puts 27 % 6 # 3
puts 5 + 5 / 2.0 # 7.5

# Numbers Exercise 1
# Write 4 examples of expressions using each of the operations: +, -, /, and %. 
# Print out the result of your expressions using puts. Be sure to test your work by running your code!

puts 10 + 10 # 20
puts 1 - 1 # 0
puts 9 / 3 # 3
puts 25 % 5 # 0

# Numbers Exercise 2
# Write 6 comparison expressions using each of the operations: ==, !=, <, >, <=, >=. 
# Print out the result of your expressions using puts. Be sure to test your work by running your code!

puts 10 == 10 # true
puts 10 != 1 # true
puts 5 > 2 # true
puts 5 < 1 # false
puts 5 >= 6 # false
puts 6 <= 5 # false

# Booleans data type

# ! (Not)
# && (And)
# || (Or)

puts 13 % 2 == 0 # false
puts 6 > 0 && 6 % 2 == 0 # true
puts true && false # false
puts !false || false # true

# String data type

puts "Hello" # Hello
puts "Hello" + " " + "World" # Hello World - Concatenation
puts "Hello".length # 5
puts "Hello"[0] # H

puts "coding".length # 6
puts "coding"[2] # g
puts "Hey" + "Programmers" # HeyProgrammers
puts "Hey-Programmers".length < 5 # false

# Variables

my_num = 42
my_num + 4
puts my_num # 42

count = 10
count += 1
puts count # 11

count *= 5
puts count # 55

first_name = "Luis"
last_name = "Flores"
full_name = first_name + " " + last_name
puts full_name # "Luis Flores"

sentence = "There is no spoon"
puts "---1:"
puts sentence + "?"   # There is not spoon?

puts "---2:"
puts sentence         # There is no spoon

sentence += "."
puts "---3:"
puts sentence         # There is no spoon.

num = 6 / 2
puts "---4:"
puts num              # 3

puts "---5:"
puts sentence[num]    # r

num = 40
num + 5
puts "---1:"
puts num                   # 40

num += 2
puts "---2:"
puts num                   # 42

isEven = num % 2 == 0
puts "---3:"
puts isEven                # true

isNegative = num < 0
puts "---4:"
puts isNegative            # false

puts "---5:"
puts isEven || isNegative  # true

puts "---6:"
puts isEven && isNegative  # false

puts "---7:"
puts isEven && !isNegative # true

# Methods

def say_welcome_message
    puts "Hello"
end

puts "Before method call"
say_welcome_message # "Hello"
puts "After method call"

# Parameters

def say_hello(person)
    puts "Hello " + person + "!"
end

say_hello("Luis") # Hello Luis!

# Methods return

def sum(num_1, num_2)
    num_1 + num_2
end

puts sum(1,1) # 1

# Method exercise

def average_of_three(num_1, num_2, num_3)
    sum = num_1 + num_2 + num_3
    sum / 3.0

end

puts average_of_three(5,3,10) # 6.0
puts average_of_three(3, 7, 8)   # => 6.0
puts average_of_three(2, 5, 17)  # => 8.0
puts average_of_three(2, 8, 1)  #3.666...

def goodbye(name)
    "Good bye" + " " + name + "."
end

puts goodbye("Daniel")   # => "Bye Daniel."
puts goodbye("Mark")     # => "Bye Mark."
puts goodbye("Beyonce")  # => "Bye Beyonce."