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

dog.each do |k, v|
    puts "-" + k
    puts "--" + v.to_s 
end

dog.each_key do |k|
    puts k
end

dog.each_value do |v|
    puts v
end

counter = Hash.new(0)

str = "bootcamp"
str.each_char do |char|
    counter[char] += 1
end

puts counter

key = "o"

puts counter[key] # 2

mississipi_river_str = "Mississipi River"
hash_counter = Hash.new(0)

mississipi_river_str.each_char { |char| hash_counter[char] += 1 }

sorted = hash_counter.sort_by { |k,v| v }

puts sorted[-1][0] # i

def get_double_age(hash)
    hash["age"] * 2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46

def get_full_name(hash)
    hash["first"] + " " + hash["last"] + ", the " + hash["title"]
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"

def word_lengths(sentence)
    word_length_hash = {}
    sentence.split(" ").each { |word| word_length_hash[word] = word.length }
    word_length_hash
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}

def retrieve_values(hash1, hash2, key)
    [hash1[key], hash2[key]]
end


dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts


def cat_builder(name_str, color_str, age_num)
    {"name" => name_str, "color" => color_str, "age" => age_num }
end

print cat_builder("Whiskers", "orange", 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder("Salem", "black", 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts

def ae_count(str)
    str_ae_hash = Hash.new(0)
    str.each_char do |char|
        str_ae_hash[char] += 1 if char == "a" || char == "e"
    end

    str_ae_hash
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}

def element_count(arr)
    count_hash = Hash.new(0)
    arr.each { |ele| count_hash[ele] += 1 }
    count_hash
end

puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}

def select_upcase_keys(hash)
    upcase_hash = Hash.new("")
    hash.each_key { |key| upcase_hash[key] = hash[key] if key.upcase == key }
    upcase_hash

end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts

def hand_score(hand)
    hash_score = {
        "a" => 4, 
        "k" => 3, 
        "q" => 2, 
        "j" => 1 
    }

    sum = 0
    hand.each_char { |char| sum += hash_score[char.downcase] }
    sum
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9

def frequent_letters(string)
    counter_hash = Hash.new(0)
    string.each_char { |char| counter_hash[char] += 1}
    char_arr = []

    counter_hash.each_key { |key| char_arr << key if counter_hash[key] > 2 }
    char_arr
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts

def hash_to_pairs(hash)
    hash.sort_by { |k, v| k }
end


print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts

def element_replace(arr, hash)
    arr.map do |ele|
        if hash.has_key?(ele)
            hash[ele]
        else
            ele
        end
    end
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts

# Map & Select

new_arr = vowels_arr.map { |ele| ele.upcase + "!"}
puts new_arr

nums_arr = [1,2,3,4,5]
puts nums_arr.select { |ele| ele % 2 == 0 }

# Advance methods

def map_by_name(arr)
    arr.map { |hash| hash["name"] }
end


pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
puts

countries = [
 {"name"=>"Japan", "continent"=>"Asia"},
 {"name"=>"Hungary", "continent"=>"Europe"},
 {"name"=>"Kenya", "continent"=>"Africa"},
]
print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
puts

def map_by_key(arr, key)
    arr.map { |hash| hash[key] }
end

locations = [
  {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
]

print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
puts
print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
puts

def yell_sentence(sent)
    sent.split(" ").map { |char| char.upcase + "!" }.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

def whisper_words(words)
    words.map { |word| word.downcase + "..."}
end

print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
puts

def o_words(sentence)
    sentence.split(" ").select { |word|  word.include?("o") }
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts

def last_index(str, char)
  i = str.length - 1
  while i >= 0
    return i if str[i] == char
    i -= 1
  end
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7

def most_vowels(sentence)
    current_long_word = ""

    sentence.split(" ").each { |word| current_long_word = count_vowel(current_long_word, word)}

    current_long_word
end

def count_vowel(word1, word2)
    word1_count = word1.split("").select { |char| $vowels.include?(char) }
    word2_count = word2.split("").select { |char| $vowels.include?(char) }

    word1 < word2 ? word2 : word1
end

print most_vowels("what a wonderful life") #=> "wonderful"

def prime?(num)
    return false if num < 2
    (2...num).each { |factor|  return false if num % factor == 0 }
    true
end

puts
puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false

def pick_primes(numbers)
    numbers.select { |num| prime?(num) }
end

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts

def prime_factors(num)
    (2...num).select { |factor| num % factor == 0 && prime?(factor) }
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts

def greatest_factor_array(arr)
    arr.map { |num| num.even? ? get_factor(num) : num }
end

def get_factor(num)
    (1...num).reverse_each { |factor| return factor if num % factor == 0 }
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts

def perfect_square?(num)
    (1..num).each { |factor| return true if factor * factor == num }
    false
end

puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true

def triple_sequence(start, length)
    triple_arr = [start]
    (length - 1).times { triple_arr << triple_arr[-1] * 3 }
    triple_arr
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts

puts "---"

def summation_sequence(start, length)
    seq = [start]

    while seq.length < length
        seq << sumation(seq[-1])
    end

    seq
end

def sumation(num)
    (1..num).reduce(0) {|acc, ele_num| acc += ele_num }
end

print summation_sequence(3, 4) # => [3, 6, 21, 231]
puts
print summation_sequence(5, 3) # => [5, 15, 120]

puts 

def fibonacci(length)
    initial_arr = [1,1]
    return [] if length < 1
    return initial_arr.take(length) if length < 3

    while initial_arr.length < length
     initial_arr << initial_arr[-1] + initial_arr[-2]
    end

    initial_arr
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts

# Feel free to use this variable:
$alphabet = "abcdefghijklmnopqrstuvwxyz"
$alphabet_hash = Hash.new("")

$alphabet.each_char.with_index { |char, idx| $alphabet_hash[idx] = char }

def caesar_cipher(str, num)
    str.split("").map { |char| cipher_char(char, num) }.join("")
end

def cipher_char(char,num)
    $alphabet_hash[($alphabet.index(char) + num) % 26]
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"

puts

def vowel_cipher(string)
    string.split("").map do |char|
        if $vowels.include?(char)
            next_vowel(char) 
        else
            char
        end
    end.join("")
end

def next_vowel(char)
    $vowels[($vowels.index(char) + 1) % 5]
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap

def double_letter_count(string)
    string.split(" ").count { |word| double_letter_word?(word) }
end

def double_letter_word?(word)
    hash_char = Hash.new(0)
    word.each_char { |char| hash_char[char] += 1 }
    hash_char.values.each { |ele| return true if ele >= 2 }
    false 
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1

def adjacent_sum(arr)

end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts

def adjacent_sum(arr)
  new_arr = []
  (0...arr.length).each do |idx|
    new_arr << arr[idx] + arr[idx + 1] if arr[idx + 1] != nil 
  end
  new_arr
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
    pyramid_arr = [base]

    while pyramid_arr.length < base.length
        pyramid_arr << adjacent_sum(pyramid_arr[-1])
    end

    pyramid_arr.reverse
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts

def all_else_equal(arr)
    mid_num = arr.reduce(0) { |acc, num| acc += num } / 2
    return mid_num if arr.include?(mid_num)
    nil
end

p all_else_equal([2, 4, 3, 10, 1]) #=> 10, because the sum of all elements is 20
p all_else_equal([6, 3, 5, -9, 1]) #=> 3, because the sum of all elements is 6
p all_else_equal([1, 2, 3, 4])     #=> nil, because the sum of all elements is 10 and there is no 5 in the array


def anagrams?(word1, word2)
    get_hash(word1) == get_hash(word2)
end

def get_hash(word)
    word_hash = Hash.new(0)
    word.each_char { |char| word_hash[char] += 1 }
    word_hash
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false

def consonant_cancel(sentence)
    sentence.split(" ").map { |word| remove_consonant(word) }.join(" ")
end

def remove_consonant(word)
    i = 0

    while i < word.length
        if $vowels.include?(word[i])
            return word[i..-1]
        end
        i += 1
    end

    word
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"

def same_char_collapse(str)
    new_str = str
    repeat = true
    while repeat
        repeat = false
        temp_str = remove_same_char(new_str)
        if new_str != temp_str
            new_str = temp_str
            repeat = true
        end
    end

    new_str
end

def remove_same_char(word)
    i = 0
    j = i + 1
    new_word = word
    while j < word.length
        if word[i] == word[j]
            new_word = word[0...i] + word[j + 1..-1]
            break
        end
        i += 1
        j += 1
    end
    new_word
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
