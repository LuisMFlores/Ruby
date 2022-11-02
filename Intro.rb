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

# Array

names_arr = ["Luis", "Merlin", "Jean"]
puts names_arr[0] # Luis
puts names_arr[2] # Jean

# Shovel

names_arr << "mami" << "papi"


puts names_arr

def doubler(numbers)
    i = 0
    new_numbers = []

    while i < numbers.length
        new_numbers << numbers[i] * 2
        i += 1
    end

    new_numbers
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]

def yell(words)
    i = 0
    new_arr_words = []

    while i < words.length
        new_arr_words << words[i] + "!"
        i += 1
    end 

    new_arr_words
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

def element_times_index(numbers)
    new_nums = []
    i = 0

    while i < numbers.length
        new_nums << numbers[i] * i
        i += 1
    end

    new_nums
end

puts 

print element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]
puts
print element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]
puts 

def even_nums(max)

    even_nums_arr = []
    i = 0

    while i <= max
        even_nums_arr << i if i.even?
        i += 1
    end

    even_nums_arr
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]

def range(min, max)
    i = min
    nums_arr = []


    while i <= max
        nums_arr << i
        i += 1
    end

    nums_arr
end

puts 
print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
puts
print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]
puts

def odd_range(min, max)
    i = min
    odd_range_arr = []

    while i <= max
        odd_range_arr << i if !i.even?
        i += 1
    end

    odd_range_arr
end

print odd_range(11, 18) # => [11, 13, 15, 17]
puts
print odd_range(3, 7)   # => [3, 5, 7]

def reverse_range(min, max)
    i = max - 1

    reversed_range_arr = []

    while i > min
        reversed_range_arr << i
        i -= 1
    end

    reversed_range_arr
end

print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]

def first_half(array)
    i = 0
    arr = []
    max = array.length / 2.0

    while i < max
        arr << array[i]
        i += 1
    end

    arr

end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]

def factors_of(num)
    i = 1
    factors = []


    while i <= num
        factors << i if factor(num, i)
        i += 1
    end

    factors
end

private def factor(num1, num2)
    num1 % num2 == 0
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]

def select_odds(numbers)
    numbers.select { | ele | !ele.even? }
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []

def select_long_words(words)
    [words.reduce("") { |acc, ele| acc.length < ele.length ? ele : acc }]
end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]

def sum_elements(arr1, arr2)
    sum_ele_arr = []
    i = 0

    while i < arr1.length
        sum_ele_arr << arr1[i] + arr2[i]
        i += 1
    end

    sum_ele_arr
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]

def fizz_buzz(max)
    (1...max).select { |ele| (ele % 4 == 0 || ele % 6 == 0) && !(ele % 4 == 0 && ele % 6 == 0) }
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]

# Arrays methods

names_arr_2 = ["Luis", "Merlin"]
puts names_arr_2
names_arr_2 << "Jean" # shovels one element to the end. Evaluates to arr itself
puts names_arr_2
names_arr_2.push("Mami") # adds elements to end of arr Evaluates to arr itself
puts names_arr_2
names_arr_2.pop # removes last element. Evaluates to the element itself
puts names_arr_2

names_arr_2.unshift("Papi") #Adds element to fron of the array. Evaluates to the arr itself
puts names_arr_2
names_arr_2.shift # Removes the first element of the array. Evaluates to the removed element.

puts names_arr_2.index("Merlin") # 1
p names_arr_2.index("mami") # nil

puts names_arr_2.include?("Luis") # true
puts names_arr_2.include?("tito") # false

hello_str = "Hello"
puts hello_str.include?("ello") # 1
puts hello_str.include?("elloz") # nil


# Ranges

letters_arr = ["a", "b", "c", "d", "e"]

puts letters_arr[1...3] #exclusive [b,c]
puts letters_arr[1..3] #inclusive [b,c,d]

str_bootcamp = "bootcamp"

puts str_bootcamp[1..3] # oot
puts str_bootcamp[1...3] #oo
puts str_bootcamp[2..-1] #otcamp
puts str_bootcamp[-2] #m

str_yellow = "Follow the yellow brick road"

print str_yellow.split(" ")

how_are_you_arr = ["How", "are", "you"]
puts
puts how_are_you_arr.join(" ")

# Enumerables methods

months = ["JAN", "FEB", "MAR", "APR"]

months.each  { |month| puts month }

months.each do |month|
    puts month
    puts "---"
end

months.each_with_index do |month, idx|
    puts "#{idx + 1} - #{month}"
end

sentence_hello_word = "Hello World"

sentence_hello_word.each_char do |char|
    print char
end

puts

sentence_hello_word.each_char.with_index do | char, idx|
    print puts "#{idx + 1} - #{char}"
end

# Ranges enumerable

def fizBuzz(max)
    arr = []
    (0..max).each { |ele| arr << ele if ele.even? }
    arr
end

p fizBuzz(100)

4.times { puts "hi" }

def to_initials(name)
    words = name.split(" ")
    initials = ""

    words.each { |word| initials += word[0] }

    initials
end

# Bad code because a lot going on but still fun to try new things
def private_to_initials(name)
    name.split(" ").reduce("") { |acc, word| acc += word[0] }
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

def first_in_array(arr, el1, el2)
    arr.each { |ele| return ele if ele == el1 || ele == el2 }
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"

def abbreviate_sentence(sent)
    words = sent.split(" ")
    new_sent = []

    words.each do |word|
        new_sent << (word.length > 4 ? private_remove_vowels(word) : word)
    end

    new_sent.join(" ")
end

$vowels = "aeiou"

def private_remove_vowels(word)
    word.split("").select { |ele| !$vowels.include?(ele) }.join("")
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
    formatted_str = []

    str.split(" ").each { |part| formatted_str << part[0].upcase + part[1..-1].downcase }

    formatted_str.join(" ")
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
    str_parts = str.split(" ")
    return false if str_parts.length < 2

    str_parts.each do |ele|
        return false if format_name(ele) != ele
    end

    true
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

$alphabet = "abcdefghijklmnopqrstuvwxyz"

def is_valid_email(str)
    parts = str.split("@")
    
    return false if parts.length != 2
    return false if parts[0].downcase != parts[0]
    parts[0].each_char { |char| return false if !$alphabet.include?(char) }

    return false if parts[1].split(".").length != 2

    true

end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false

def reverse_words(sent)
    reversed_words_arr = []
    sent.split(" ").each { |word| reversed_words_arr << word.reverse }
    reversed_words_arr.join(" ")
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'

def rotate_array(arr,num)
    num.times do 
        arr.unshift(arr.pop)
    end
    arr
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts

# Nested loops

(1..3).each do |num1|
    puts num1
    puts "---"
    (1..5).each do |num2|
        puts num2
    end

end

vowels_arr = ["a", "e", "i", "o", "u"]

vowels_arr.each_with_index do |ele1, idx1|
    vowels_arr.each_with_index do |ele2, idx2|
        if idx2 > idx1
            puts ele1 + ele2 
            puts idx1.to_s + " " + idx2.to_s
        end
    end
    puts "-------"
end

some_arr = [
    ["a", "b", "c"],
    ["d", "e"],
    ["f", "g", "j", "k"]
]

puts some_arr[2].length # 4
puts some_arr[2][0] == "f" # true
puts some_arr[1].length # 2
puts some_arr[1][1] == "e" #true
puts some_arr.length # 3

some_arr.each do |sub_arr|
    print sub_arr
    puts
    sub_arr.each do |ele|
        puts ele
    end
    puts"----"
end

def combinations(arr)

    new_arr = []

    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            new_arr << [ele1, ele2] if idx2 > idx1
        end
    end

    new_arr

end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts

def opposite_count(nums)
    sum = 0

    nums.each_with_index do |num1, idx1|
        nums.each_with_index do |num2, idx2|
            sum += 1 if idx2 > idx1 && num1 + num2 == 0
        end
    end
    sum
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1

def two_d_sum(arr)
    sum = 0

    arr.each do |sub_arr|
        sub_arr.each do |ele|
            sum += ele
        end
    end

    sum
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15

def two_d_translate(arr)
    new_arr = []

    arr.each do |pair_arr|
        pair_arr[1].times { new_arr << pair_arr[0] }
    end

    new_arr
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts

def array_translate(array)

    str = ""
    i = 0

    while i < array.length
        array[i + 1].times { str += array[i] }
        i += 2
    end

    str

end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)

    new_word = ""

    if $vowels.include?(word[0])
        new_word += word + "yay"
    else
        first_vowel_idx = 0
        word.each_char.with_index { |ele, idx| first_vowel_idx = idx if $vowels.include?(ele) }
        new_word += word[first_vowel_idx..-1] + word[0...first_vowel_idx] + "ay"
    end

    new_word

end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"

# Hashes

my_hash = {"name" => "App Academy", "color" => "red", "age" => 5}

puts my_hash["name"] #App Academy

my_hash["color"] = "blue"

puts my_hash

dog = {
    "name" => "fido",
    "color" => "black",
    "age" => 3,
    "isHungry" => true,
    "enemies" => ["squirrel"]
}

dog["location"] = "NYC"

puts dog["enemies"]

puts dog

dog["enemies"] << "cats"

puts dog

puts dog.has_key?("location") # true