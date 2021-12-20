# Basics

# Priting text

puts "Hello World\n"

# Numbers

puts 1 + 1 #2
puts 2 * 2 #4
puts 9 / 2 #Needs to add decimal to get correct answer
puts (9.0 + 2) / 2 #Order of operations
puts  10 % 2 #0

# Comparisons

puts 4 == 3 #false
puts 4 != 3 #true
puts 3 < 2 #false
puts 3 > 2 #true
puts (5+5) == 10 #true
puts 3 <= 2 #false
puts 3 >= 3 #true

# Booleans

puts false && false #false
puts false && true #false
puts true && false #false
puts true && true #true

puts !true #false
puts !false #true

puts false || false #false
puts true || false #true
puts false || true #true
puts true || true #true

# Priting data

p 42 #prints the information of data type
print "42" #prints without newline
puts "42" #prints with new line

# Strings

puts "Hello World" #Hello World
puts "My" + " " + "name" + " " + "is" + " " + "Luis" #My name is Luis
puts "Luis".length #4
puts "Luis"[0] #L
puts "Luis"["Luis".length - 1] #s

# Varibles

location = "Tampa" #Tampa
puts location #Tampa
my_num = 42
puts my_num + 8 #50
sec_num = 8 #8
my_num = sec_num #8
sec_num = 5 #5
p my_num #8
p sec_num #5

new_location = location #Tampa
new_location[0] = "L" #L
puts location #Lampa

# Methods

def say_message
    "Hello"
end

say_message

def say_hello_to(user)
    puts "Greetings " + user
end

say_hello_to("Luis") #Greetings Luis

def greeting(user, message = say_message) 
    puts message + " " + user
end

greeting("Luis") #Hello Luis
greeting("Merlin", "Hola") #Hola Merlin

def calc_avg(num1, num2)
    (num1 + num2) / 2.0
end

puts calc_avg(2,2) #2.0
puts calc_avg(50,10) #30.0

def average_of_three(num1, num2, num3)
    (num1 + num2 + num3) / 3.0
end

puts average_of_three(7,10,13) #10.0

def goodbye(name)
    "Bye" + " " + name
end

puts goodbye("Luis") #Bye Luis

# Conditionals

num = 0
if num > 0
    puts "Its positive"
else
    puts "Negative"
end #Negative

if num == 0
    puts "Number is 0"
elsif num > 0
    puts "Number is Positive"
else
    puts "Number is Negative"
end #Number is 0

def is_divided_by_5(number)
    number % 5 == 0
end

puts is_divided_by_5(15) #True
puts is_divided_by_5(21) #False

def either_only(number)
    return false if (number % 3 == 0 && number % 5 == 0) || (number % 3 == 0 && number % 5 == 0)
    true
end

puts either_only(15) #False
puts either_only(5) #True
puts either_only(30) #False

def larger_number(num1, num2) 
    return num1 if num1 > num2
    num2
end

puts larger_number(2,4) #4
puts larger_number(4,2) #4
puts larger_number(100,2) #100
puts larger_number(0,1) #1

def longer_string(str1, str2)
    return str1 if str1.length > str2.length
    str2
end

puts longer_string("Luis","Merlin") #Merlin
puts longer_string("Luis Manuel","Merlin") #Luis Manuel

def number_check(num)
    return "Positive" if num > 0
    return "Negative" if num < 0
    "Zero"
end

puts number_check(10) #Positive
puts number_check(-5) #Negative
puts number_check(0) #Zero

def word_check(str)
    return "Long" if str.length > 6
    return "Short" if str.length < 6
    "Medium"
end

puts word_check("contraption") # => "long"
puts word_check("fruit")       # => "short"
puts word_check("puzzle")      # => "medium"

# Loops

def repeatHello()
    counter = 0
    while counter < 5
        puts "Hello"
        counter += 1
    end
end

repeatHello # Hello(5x)

def print_nums
    i = 0
    while i <= 100
        puts i
        i +=1
    end
end

print_nums # Prints number 1-100

def print_backwards
    i = 10
    while i >= 0
        puts i
        i -= 1
    end
end

puts print_backwards # Print numbers 10-0

def print_min_max(min,max)
    print_min_max_step(min,max,1)
end

def print_min_max_step(min,max,step,inclusive = true)
    i = min
    new_max = max
    new_max = max + 1 if inclusive
    while i < new_max
        puts i
        i += step
    end
end

print_min_max(2,20) #Print 2 - 20 
print_min_max_step(1,100,5) #print 1-100 stepping thru 5
print_min_max_step(1,106,5,false) #Print 1-100 stepping thru 5 not including 106

def iterating_thru_string(str)
    i = 0
    while i < str.length
        puts str[i]
        i += 1
    end
end

iterating_thru_string("Luis") #Print L\nu\ni\ns\n

#Break and next
def skip_every_3_15_divisible(min,max)
    i = min
    while i < max
        if (i % 3 == 0 && i % 5 == 0)
            i += 1
            next
        end
        puts i
        i += 1
    end
end

skip_every_3_15_divisible(1,100) # Print every number 1 to 99 skipping every number divisible by 3 and 5

def count_char(word,char,ignored_cap = true)
    char_count = 0
    i = 0
    new_word = word
    new_word = word.downcase if ignored_cap
    while i < word.length
        char_count += 1 if new_word[i]  == char
        i += 1
    end
    char_count
end

def count_e(word)
    count_char(word,"e")
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3

def count_a(word)
    count_char(word,"a")
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3

def count_vowels(word)
    vowel_counter = 0
    i = 0
    while i < word.length
        vowel_counter += 1 if word[i] == "a" || word[i] == "e" || word[i] == "i" || word[i] == "o" || word[i] == "u"
        i += 1
    end
    vowel_counter
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2

def sum_nums(max)
    i = 0
    counter = 0
    while i <= max
        counter += i
        i +=  1
    end
    counter
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15

def factorial(num)
    i = 1
    factorial = 1
    while i <= num
        factorial *= i
        i += 1
    end
    factorial
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
puts reverse("bootcamp")   

def is_palindrome(word)
    word == reverse(word)
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false

#Array

letters = ["a","e","i","o","u"]
print letters

family_names = [
    "Luis",
    "Merlin",
    "Jean",
    "Mami",
    "Papi",
    "Gordo"
]

puts family_names #names

numbers = []
numbers << 1
numbers << 2
numbers << 3

puts numbers # 1,2,3

numbers[1] = 5
puts numbers #1,5,3

def print_array(arr)
    i = 0
    while i < arr.length
        puts arr[i]
        i += 1
    end
end

print_array(family_names) #Prints family_names arr
print_array(numbers) #Prints numbers arr

def doubler(nums)
    new_numbers = []
    i = 0
    while i < nums.length
        new_numbers << nums[i] * 2
        i += 1
    end
    new_numbers
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]

def yell(words)
    yelled_words = []
    i = 0
    while i < words.length
        yelled_words << words[i] + "!"
        i += 1
    end
    yelled_words
end

puts
print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

def even_nums(max)
    even_num_arr = []
    i = 0
    while i <= max
        even_num_arr << i if i % 2 == 0
        i += 1
    end
    even_num_arr
end

puts
print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]

def range(min, max)
    range_arr = []
    i = min
    while i <= max
        range_arr << i
        i += 1
    end
    range_arr
end

print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
puts
print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]

def odd_range(min, max)
    odd_range_arr = []
    i = min
    while i <= max
        odd_range_arr << i if i % 2 != 0
        i += 1
    end
    odd_range_arr
end

print odd_range(11, 18) # => [11, 13, 15, 17]
puts
print odd_range(3, 7)   # => [3, 5, 7]


def reverse_range(min, max)
    reversed_range_arr = []
    i = max - 1
    while i > min
        reversed_range_arr << i
        i -= 1
    end
    reversed_range_arr
end

puts
print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]

def first_half(array)
    first_half_arr = []
    middle = array.length / 2.0
    i = 0
    while i < middle
        first_half_arr << array[i]
        i += 1
    end
    first_half_arr
end

puts
print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]

def select_odds(numbers)
    odd_numbers = []
    i = 0
    while i < numbers.length
        odd_numbers << numbers[i] if numbers[i] % 2 != 0
        i += 1
    end
    odd_numbers
end

puts
print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])  

def select_long_words(words)
    long_word_arr = []
    i = 0
    while i < words.length
        word = words[i]
        long_word_arr << word if word.length > 4
        i += 1
    end

    long_word_arr
end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]

def sum_elements(arr1, arr2)
    new_ele_arr = []
    i = 0
    max_i = arr1.length
    while i < max_i
        new_ele_arr << arr1[i] + arr2[i]
        i += 1
    end
    new_ele_arr
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]

def fizz_buzz(max)
    new_nums = []
    i = 1
    while i < max
        new_nums << i if (i % 4 == 0 && i % 6 != 0) || (i % 4 != 0 && i % 6 == 0)
        i += 1
    end
    new_nums
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]

# Push / Pop
puts
friends_name_arr = ["Mario"]
friends_name_arr.push("Celeste", "Leo").push("Merlin") # => ["Mario", "Celeste", "Leo", "Merlin"]
print friends_name_arr
puts

print friends_name_arr.pop # => Merlin
puts
print friends_name_arr # => ["Mario", "Celeste", "Leo"]
puts
print friends_name_arr.unshift("Merlin") # => ["Merlin", "Mario", "Celeste", "Leo"]
puts
print friends_name_arr.shift # => "Merlin"
puts

# Array Index / Include

city_arr = ["LA", "NY", "SF", "TPA"]
puts city_arr.index("LA") # => 0
puts city_arr.include?("NJ") # => false

str_arr = "Hello"
puts str_arr.index("e") # => 1
puts str_arr.include?("o") # => true

# Reverse method
puts
puts str_arr.reverse # => "olleH"

def is_palindrome?(word)
    word == word.reverse
end

puts is_palindrome("civic") # true
puts is_palindrome("opa") # false

# Range slicing 

puts "Hello"[0..4] # "Hello"
puts "Luis"[1...5] # "uis"
puts "ABC"[-1] #"C"
puts "ABCDE"[2...-1] # "CD"

# Split/Joint

name_arr = "luis".split("")
print name_arr # ["l", "u", "i", "s"]
puts
print name_arr.join # "luis"
puts

# Enumerable
months_arr = ["Jan", "Feb", "Mar", "Apr"]
months_arr.each do | month |
    puts month
    puts "---" # Print each month with dashes
end

months_arr.each_with_index do |month, idx|
    print idx
    puts " index is month " + month
end

people_arr = ["Luis", "Merlin", "Jean"] # ["Luis", "Merlin", "Jean"]
people_arr.each { |person | puts person } # Print each element in the array

sentence = "Hello World"

sentence.each_char do |char|
    print char # "Hello World"
end

sentence.each_char.with_index do |char, idx|
    puts idx
end

def fizz_buzz_with_range(max_num)
    new_arr = []
    (0..max_num).each { |num| new_arr << num if (num % 3 == 0 && num % 5 != 0) || (num % 3 != 0 && num % 5 == 0) }
    new_arr
end

puts fizz_buzz_with_range(100)

# Times

10.times { puts "Hello user" } # Will print block of code x amount of times


# Write a method to_initials that takes in a person's name string and returns a string representing their initials.
# 1. create new variable to hold initials.
# 2. split the str into a arr of word.
# 3. iterate thru the word arr.
# 4. append the first index char for each word.
# 5. return the new variable thats holding the initials.

# Notes can be further simplified using reduce
def to_initials(name)
    str_initial = ""
    name.split(" ").each { |word| str_initial += word[0] }
    str_initial
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

# Write a method first_in_array that takes in an array and two elements, the method should return the element that appears earlier in the array.
# 1. iterate thru the array.
# 2. compare each element in the array against the element passed as parameters and return whichever comes first
def first_in_array(arr, el1, el2)
    arr.each do | ele |
        if ele == el1 
            return el1
        elsif ele == el2
            return el2
        end
    end
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"

# Write a method abbreviate_sentence that takes in a sentence string and returns a new sentence where every word longer than 4 characters has all of it's vowels removed
# 1. Create new variable to hold an array of words.
# 2. Break sentence into a word array.
# 3. Check the length of the word and if it passes, **runs it thru another method to remove vowles**
# 4. return joined array of words.

# -- Method to remove vowels --
# 1. Create a new method that takes in a word and returns a word
# 2. Create new variable to hold the non vowel characters.
# 3. Create constant that hold all the vowels.
# 4. Loop thru the word and check againts the vowels constant.

def abbreviate_sentence(sent)
    new_sentence_word_arr = []
    sent.split(" ").each do |word| 
        if word.length > 4
            new_sentence_word_arr << remove_vowels(word)
        else
            new_sentence_word_arr << word
        end
    end
    new_sentence_word_arr.join(" ")
end

def remove_vowels(word)
    words = "aeiou"
    non_vowel_word = ""
    word.each_char { |char| non_vowel_word += char if !words.include?(char)}
    non_vowel_word
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

# Write a method format_name that takes in a name string and returns the name properly capitalized.
# 1. make the parameter lower string.
# 2. split the sentence into array.
# 3. capitalize each word in the array.
# 4. return joined arr as string.
def format_name(str)    
    str.downcase.split(" ").each { |word| word.capitalize! }.join(" ")
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian

# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
    str == format_name(str)
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

# 1. Split the email between the "@"
# 2. Check the splitted array is exactly 2 if not return false.
# 3. Get index of @.
# 4. Return false if initial index to at index is not the same as lower case.
# 5. range from at index of str to end, split the str by the dot and check the size of arr to equal 2.
# 6. return true if all other failed.

def is_valid_email(str)
    email_splitted = str.split("@")
    return false if email_splitted.length != 2

    at_index = str.index("@")
    numbers = "0123456789"
    return false if str[0...at_index].downcase != str[0...at_index]
    str[0...at_index].each_char { |char| return false if numbers.include?(char)}
    return false if str[at_index..-1].split(".").length != 2

    true

end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false

# Write a method reverse_words that takes in a sentence string and returns the sentence with the order of the characters in each word reversed. Note that we need to reverse the order of characters in the words, do not reverse the order of words in the sentence.
# 1. Break the parameter into a array.
# 2. Iterate over the array and reversed each element.
# 3. Joined array into a string and return it.
def reverse_words(sent)
    sent.split(" ").each { |word| word.reverse! }.join(" ")
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'

# Write a method rotate_array that takes in an array and a number. The method should return the array after rotating the elements the specified number of times. A single rotation takes the last element of the array and moves it to the front.

# 1.
def rotate_array(arr, num)
    num.times { rotate(arr) }
    arr
end

def rotate(arr) 
    arr.unshift(arr.pop)
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts

(1..3).each do |ele1|
    (1..5).each do |ele2|
        puts ele1.to_s + "---" + ele2.to_s
    end
end

# Multi-dimensional arr

# Write a method combinations that takes in an array of unique elements, the method should return a 2D array representing all possible combinations of 2 elements of the array.

# 1. Loop thru the items with index.
# 2. Loop thru the items with index + 1 and check if the index are different.
# 3. If different, add both element to the new arr.
# 4. Return new arr.

def combinations(arr)
    combination_arr = []
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            combination_arr << [ele1, ele2] if idx2 > idx1
        end
    end
    combination_arr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts

# Write a method opposite_count that takes in an array of unique numbers. The method should return the number of pairs of elements that sum to 0.
# 1. Create variable to keep track of the count.
# 2. loop thru the arr.
# 3. check that there is an index always ahead.
# 4. if it is, add both numbers .
# 5. if the sum is 0 add one to the count.
# 6. return variable containing count.

def opposite_count(nums)
    opposite_count_num = 0
    nums.each_with_index do |ele1, idx1|
        nums.each_with_index do |ele2, idx2|
            opposite_count_num += 1 if (idx2 > idx1) && (ele1 + ele2 == 0)
        end
    end
    opposite_count_num
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1

# Write a method two_d_Sum that takes in a two dimensional array and returns the sum of all elements in the array.

# create sum var
# loop thru 2d arr
# loop thru each 2 level of the 2d arr
# add each item to the sum var
# return sum var

def two_d_sum(arr)
    sum_var = 0
    arr.each do |items|
        items.each { |item| sum_var += item }
    end
    sum_var
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

# Write a method two_d_translate that takes in a 2 dimensional array and translates it into a 1 dimensional array. You can assume that the inner arrays always have 2 elements. See the examples.

# create var to hold eles
# iterate thru outter arr.
# iterate x amount of time of the last element in the intter array and add these eles to new var
# return var eles

def two_d_translate(arr)
    elements = []
    arr.each do | inner_arr |
        inner_arr[1].times { |i| elements << inner_arr[0] }
    end
    elements
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

# Write a method array_translate that takes in an array whose elements alternate between words and numbers. The method should return a string where each word is repeated the number of times that immediately follows in the array.
# create var to hold data
# iterate thru outter arr
# iterate thru inner arr
# compare index and if is not higher than current index, add as multiple times as possible
# return var with data

def array_translate(array)
    arr_sent = ""
    array.each_with_index do | current_ele, current_idx |
        array[current_idx + 1].times { |i| arr_sent += current_ele } if current_idx % 2 == 0
    end
    arr_sent
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

# - create a vowels string
# - check if first character of word is in the vowels string.
# - if it is, add yay to the word and return it.
# - if is not, send word to method to get vowels remove.
# - add yay to returned string and return.



def pig_latin_word(word)

    vowels = "aeiou"
    if vowels.include?(word[0])
        return word += "yay"
    else
        return remove_vowels_until_vowel(word) + "ay"
    end

end

# Loop thru characters
# when a vowel is found, return range of word 
def remove_vowels_until_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index do | char, idx |
        return word[idx..-1] if vowels.include?(char)
    end
end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"

# Hashes

my_hash = { "name" => "Luis", "lastName" => "Flores", "age" => 29 }
puts my_hash["name"] # "Luis"

puts my_hash.has_key?("name") # true
puts my_hash.has_value?(29) # true

my_hash.each do |key, val|
    puts key + " belongs to value: " + val.to_s
end

def char_counter_with_char(set)

    char_hash = Hash.new(0)
    set.each_char do | char |
        char_hash[char] += 1
    end
    char_hash
end

puts char_counter_with_char("bootcamp prep")

# Write a method get_double_age that takes in a hash and returns twice the "age" value of the hash.

# acess hash age key and multiply by 2 

def get_double_age(hash)
    hash["age"] * 2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46

# Write a method get_full_name that takes in a hash containing a first, last, and title. The method should return a string representing the hash's full name

# access the first, last and title keys from hash.

def get_full_name(hash)
    hash["first"] + " " + hash["last"] + ", " + hash["title"]
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"

# Write a method word_lengths that takes in a sentence string and returns a hash where every key is a word of the sentence, and its' corresponding value is the length of that word.

# create empty hash
# split sentence into arr
# loop thru arr
# add word to hash along with length of it
# return hash

def word_lengths(sentence)
    sentence_hash = Hash.new()
    sentence.split(" ").each { |ele| sentence_hash[ele] = ele.length }
    sentence_hash
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}

# Write a method retrieve_values that takes in two hashes and a key. The method should return an array containing the values from the two hashes that correspond with the given key.

# return hash1 + hash2 with given key parameter as an arr

def retrieve_values(hash1, hash2, key)
    [hash1[key], hash2[key]]
end


dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts

# Write a method cat_builder that takes in a name, color, and age. The method should return a hash representing a cat with those values.

def cat_builder(name_str, color_str, age_num)
    { "name"=>name_str, "color"=>color_str, "age"=>age_num }
end

print cat_builder("Whiskers", "orange", 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder("Salem", "black", 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts

# Write a method ae_count that takes in a string and returns a hash containing the number of a's and e's in the string. Assume the string contains only lowercase characters.

# create new hash with default value
# loop thru each char of parameter
# add char to new hash if is a or e
# return new hash

def ae_count(str)
    str_hash = Hash.new(0)
    str.each_char { |char| str_hash[char] += 1 if (char == "a" || char == "e") }
    str_hash
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}

# Write a method element_count that takes in an array and returns a hash representing the count of each element in the array.

# create new hash
# loop thru char, increasing value of hash[value] by one
# return new hash

def element_count(arr)
    arr_hash = Hash.new(0)
    arr.each { |char| arr_hash[char] += 1} 
    arr_hash
end

puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}

# Write a method select_upcase_keys that takes in a hash and returns a new hash containing key-value pairs of the original hash that had uppercase keys. You can assume that the keys will always be strings.

# create new hash to hold values
# loop thru hash and check if key is upper case, if it is, add it to new hash
# return new hash

def select_upcase_keys(hash)
    selected = {}
    hash.each_key { |key| selected[key] = hash[key] if key == key.upcase }
    selected
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts

# Write a method hand_score that takes in a string representing a hand of cards and returns it's total score. You can assume the letters in the string are only A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 1 point. The letters of the input string not necessarily uppercase.

# create hash containing key/value
# create sum var
# iterate thru hand char and add sum with the hash given key
# return sum var
def hand_score(hand)
    card_hash = {"A"=> 4, "K"=> 3, "Q"=>2, "J"=>1}
    sum = 0
    hand.upcase.each_char { |key| sum += card_hash[key] }
    sum
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9

# Write a method frequent_letters that takes in a string and returns an array containing the characters that appeared more than twice in the string.
#   
def frequent_letters(string)
    hash_ele = element_count(string.split(""))
    new_element_arr = []
    hash_ele.each { |key, val| new_element_arr << key if val > 2}
    new_element_arr
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts

# Write a method hash_to_pairs that takes in a hash and returns a 2D array representing each key-value pair of the hash.

# create multi arr
# iterate thru hash
# append key/value pairs as array to multi arr
# return multi arr
def hash_to_pairs(hash)
    multi_arr = []
    hash.each { |k, v| multi_arr << [k, v] }
    multi_arr

end


print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts

# Write a method unique_elements that takes in an array and returns a new array where all duplicate elements are removed. Solve this using a hash.

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
    arr_hash = {}
    arr.each { |ele| arr_hash[ele] = 1 }
    arr_hash.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts

# Write a method element_replace that takes in an array and a hash. The method should return a new array where elements of the original array are replaced with their corresponding values in the hash.

#define new arr to hold val
# iterate thru arr
# check if hash has element as key
# if it does, get the value and add to the arr if not, add the element to the arr
#return new arr

def element_replace(arr, hash)
    new_arr = []
    arr.each do |ele|
        if hash.has_key?(ele) 
            new_arr << hash[ele]
        else
            new_arr << ele
        end
    end
    new_arr
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts

# Map/select

new_arr = ["a", "e", "i", "o", "u"]
puts new_arr.map { |ele| ele + "!" }

nums_arr = [1,2,3,4,5]
puts nums_arr.select { |num| num > 3 }

# Write a method map_by_name  that takes in an array of hashes and returns a new array containing the names of each hash.

# map thru iterate
# get hash for key name

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

# Write a method map_by_key that takes in an array of hashes and a key string. The method should returns a new array containing the values from each hash for the given key.

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

# Write a method yell_sentence that takes in a sentence string and returns a new sentence where every word is yelled. See the examples. Use map to solve this.

def yell_sentence(sent)
    sent.split(" ").map { |char| char.upcase + "!" }.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

# Write a method whisper_words that takes in an array of words and returns a new array containing a whispered version of each word. See the examples. Solve this using map :).

def whisper_words(words)
    words.map { |word| word.downcase + "..." }
end

print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
puts

# Write a method o_words that takes in a sentence string and returns an array of the words that contain an "o". Use select in your solution!

def o_words(sentence)
    sentence.split(" ").select { |word| word.include?("o") }
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts

# Write a method last_index that takes in a string and a character. The method should return the last index where the character can be found in the string.

def last_index(str, char)
    last_idx = 0
    str.each_char.with_index { |c, idx| last_idx = idx if char == c }
    last_idx
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7

#Write a method most_vowels that takes in a sentence string and returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)
    counts = {}
    sentence.split(" ").each { |word| counts[word] = count_vowels_new(word) }
    counts.sort_by { |k,v| v }[-1][0]
end

def count_vowels_new(word)
    vowels = "aeiou"
    word.split("").select { |char| vowels.include?(char) }.length
end

print most_vowels("what a wonderful life") #=> "wonderful"
puts

# Write a method prime? that takes in a number and returns a boolean, indicating whether the number is prime. A prime number is only divisible by 1 and itself.

def prime?(num)
    return false if num < 2
    (2...num).each { |factor| return false if (num % factor == 0) }
    true
end

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false

# Write a method pick_primes that takes in an array of numbers and returns a new array containing only the prime numbers.

def pick_primes(numbers)
    numbers.select { |num| prime?(num) }
end

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts

# Write a method prime_factors that takes in a number and returns an array containing all of the prime factors of the given number.

def prime_factors(num)
    (2...num).select { |ele_num| prime?(ele_num) && num % ele_num == 0 }
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts

# Write a method greatest_factor_array that takes in an array of numbers and returns a new array where every even number is replaced with it's greatest factor. A greatest factor is the largest number that divides another with no remainder. For example the greatest factor of 16 is 8. (For the purpose of this problem we won't say the greatest factor of 16 is 16, because that would be too easy, ha)
puts "-------------------"
def greatest_factor_array(arr)
    arr.map do |ele| 
        if ele % 2 == 0
            get_factors(ele).last
        else
            ele
        end
    end
end

def get_factors(num)
    (1...num).select { |ele_num| num % ele_num == 0 }
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts

# Write a method perfect_square? that takes in a number and returns a boolean indicating whether it is a perfect square. A perfect square is a number that results from multiplying a number by itself. For example, 9 is a perfect square because 3  3 = 9, 25 is a perfect square because 5  5 = 25.

def perfect_square?(num)
    (0..num).each { |factor| return true if factor * factor == num }
    false
end

puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true

# Write a method triple_sequence that takes in two numbers, start and length. The method should return an array representing a sequence that begins with start and is length elements long. In the sequence, every element should be 3 times the previous element. Assume that the length is at least 1.

def triple_sequence(start, length)
    seq = [start]
    (start+1..start+length-1).each { seq << seq[-1] * 3 }
    seq
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts

# A number's summation is the sum of all positive numbers less than or equal to the number. For example: the summation of 3 is 6 because 1 + 2 + 3 = 6, the summation of 6 is 21 because 1 + 2 + 3 + 4 + 5 + 6 = 21. Write a method summation_sequence that takes in a two numbers: start and length. The method should return an array containing length total elements. The first number of the sequence should be the start number. At any point, to generate the next element of the sequence we take the summation of the previous element. You can assume that length is not zero.
def summation_sequence(start, length)
    summation_seq = [start]
    while summation_seq.length < length
        seq = 0
        (0..summation_seq[-1]).each { |ele| seq += ele }
        summation_seq << seq
    end
    summation_seq
end

print summation_sequence(3, 4) # => [3, 6, 21, 231]
puts
print summation_sequence(5, 3) # => [5, 15, 120]
puts

# The fibonacci sequence is a sequence of numbers whose first and second elements are 1. To generate further elements of the sequence we take the sum of the previous two elements. For example the first 6 fibonacci numbers are 1, 1, 2, 3, 5, 8. Write a method fibonacci that takes in a number length and returns the fibonacci sequence up to the given length.

def fibonacci(length)
    return [] if length < 1
    return [1] if length < 2
    fibonacci_arr = [1,1]
    while fibonacci_arr.length < length
        fibonacci_arr << fibonacci_arr[-1] + fibonacci_arr[-2]
    end
    fibonacci_arr
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts

# Write a method caesar_cipher that takes in a string and a number. The method should return a new string where every character of the original is shifted num characters in the alphabet.


def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
    str.split("").map { |ele| alphabet[(alphabet.index(ele) + num) % alphabet.length] }.join
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"

# Write a method vowel_cipher that takes in a string and returns a new string where every vowel becomes the next vowel in the alphabet.

def vowel_cipher(string)
    vowels = "aeiou".split("")
    string.split("").map do |ele| 
        if vowels.include?(ele)
            vowels[(vowels.index(ele) + 1) % vowels.length]
        else 
            ele
        end
    end.join

end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap

# Write a method that takes in a string and returns the number of times that the same letter repeats twice in a row.

def double_letter_count(string)
    count = 0
    string.each_char.with_index do | ele, idx |
        count += 1 if ele == string[idx + 1]
    end
    count
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1

# Write a method adjacent_sum that takes in an array of numbers and returns a new array containing the sums of adjacent numbers in the original array. See the examples.

def adjacent_sum(arr)
    sum = []
    arr.each_with_index do | ele, idx |
        sum << ele + arr[idx + 1] if arr[idx + 1] != nil
    end
    sum
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts

# Write a method pyramid_sum that takes in an array of numbers representing the base of a pyramid. The function should return a 2D array representing a complete pyramid with the given base. To construct a level of the pyramid, we take the sum of adjacent elements of the level below.

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
    new_base = [base]
    while new_base.length < base.length
        new_base << sum_arr(new_base[-1])
    end
    new_base.reverse
end

def sum_arr(arr)
    count = []
    arr.each_with_index do |ele, idx|
        count << ele + arr[idx + 1] if arr[idx + 1] != nil
    end
    count
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts

# Write a method all_else_equal that takes in an array of numbers. The method should return the element of the array that is equal to half of the sum of all elements of the array. If there is no such element, the method should return nil.

def all_else_equal(arr)
    sum = 0
    arr.each { |ele| sum += ele }
    if arr.include?(sum / 2) 
        sum / 2
    else
        nil
    end
end

p all_else_equal([2, 4, 3, 10, 1]) #=> 10, because the sum of all elements is 20
p all_else_equal([6, 3, 5, -9, 1]) #=> 3, because the sum of all elements is 6
p all_else_equal([1, 2, 3, 4])     #=> nil, because the sum of all elements is 10 and there is no 5 in the array

# Write a method anagrams? that takes in two words and returns a boolean indicating whether or not the words are anagrams. Anagrams are words that contain the same characters but not necessarily in the same order. Solve this without using .sort

def anagrams?(word1, word2)
    return false if word1.length != word2.length
    word1.each_char { |char| return false if word2.index(char) == nil }
    true
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false

# Write a method consonant_cancel that takes in a sentence and returns a new sentence where every word begins with it's first vowel.

def consonant_cancel(sentence)
    vowels = ["a","e","i","o","u"]
    sentence.each_char.with_index { |char, idx| return sentence[idx...-1] if vowels.include?(char) }
    sentence
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"