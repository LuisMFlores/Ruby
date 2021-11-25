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