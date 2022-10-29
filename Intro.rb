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

# Conditional statement

def is_div_by_5(num)
    num % 5 == 0
end

puts is_div_by_5(10) # => true
puts is_div_by_5(40) # => true
puts is_div_by_5(42) # => false
puts is_div_by_5(8)  # => false

def either_only(num)
    if divisable_by(num, 3) && divisable_by(num, 5)
        return false
    elsif divisable_by(num, 3) || divisable_by(num, 5)
        return true
    else
        false
    end
end

def divisable_by(num, divisable)
    num % divisable == 0
end

puts either_only(9)  # => true
puts either_only(20) # => true
puts either_only(7)  # => false
puts either_only(15) # => false
puts either_only(30) # => false

def larger_number(num1, num2)
    num1 > num2 ? num1 : num2
end

puts larger_number(42, 28)   # => 42
puts larger_number(99, 100)  # => 100

def longer_string(str1, str2)
    str1.length > str2.length ? str1 : str2
end

puts longer_string("app", "academy") # => "academy"
puts longer_string("summer", "fall") # => "summer"
puts longer_string("hello", "world") # => "hello"

def number_check(num)
    if num < 0
        "negative"
    elsif  num > 0
        "positive"
    else
        "zero"
    end
end

puts number_check(5)    # => "positive"
puts number_check(-2)   # => "negative"
puts number_check(0)    # => "zero"

def word_check(word)
    if word.length > 6
        "long"
    elsif word.length < 6
        "short"
    else
        "medium"
    end
end

puts word_check("contraption") # => "long"
puts word_check("fruit")       # => "short"
puts word_check("puzzle")      # => "medium"

# Loops

def repeatHello

    counter = 1
    while counter < 10
        puts "Hello"
        counter += 1
    end

end

repeatHello # repeats "hello" x 9

def repeat(word, num = 1)
    counter = 1
    puts "---- Before loop ----"

    while counter <= num
        puts word
        counter += 1
    end

    puts "---- After loop ----"
end

repeat("Luima", 15)

def print_numbers(num)
    counter = 1
    while counter < num
        puts counter
        counter += 1
    end
end

print_numbers(100)

def count_e(word)
    counter = 0
    e_count = 0
    while counter < word.length
        e_count += 1 if word[counter] == "e"
        counter += 1
    end
    e_count
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3

def count_a(word)
    counter = 0
    a_counter = 0

    while counter < word.length
        a_counter += 1 if word[counter].downcase == "a"
        counter += 1
    end

    a_counter
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3



def count_vowels(word)
    vowels = "aeiou"
    counter = 0
    vowel_counter = 0

    while counter < word.length
        vowel_counter += 1 if vowels.include?(word[counter])
        counter += 1
    end

    vowel_counter
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2

def sum_nums(max)
    i = 0
    count = 0

    while i <= max
        count += i
        i += 1 
    end

    count
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15

def factorial(num)

    i = 1
    fac = 1


    while i <= num
        fac *= i
        i += 1
    end

    fac
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120

def reverse(word)
    i = word.length - 1
    reversed_word = ""

    while i >= 0
        reversed_word += word[i]
        i -= 1
    end
    reversed_word
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"

def is_palindrome(word)
    reverse(word) == word
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false