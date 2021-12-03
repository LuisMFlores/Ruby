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