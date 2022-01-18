
# Common enumerables

# All?/any?/none?/one?/count/sum/max/min/flatten

puts [2,4,6].all? { |ele| ele.even? } # True
puts [1,2,2].any? { |ele| ele % 5 == 0 } # False
puts [1,3,5].none? { |ele| ele.even? } # true
puts [1,2,3].one? { |ele| ele == 2 } # True
puts [1,2,3,4,5,6,7,8,9,10].count { |ele| ele.even? } # 5
puts [1,-3,5].sum # 3
puts [1,2,3].min #1
puts [1,2,3].max #3
puts [[1,2,3],[4,5],6].flatten # [1,2,3,4,5,6]

# Symbols
# Immutable

puts first_symbol = :hello
puts string_hello = "Hello"

# object_id
puts "Hello".object_id

luima_hash = { :name=>"Luis", :age=>30}
puts luima_hash[:name]

luima_shortenin_hash = {name:"luis", age:30}
puts luima_shortenin_hash[:age]

# Default argument

def say_greeting(user, greeting = "Hello")
    puts greeting + " " + user
end

say_greeting("Luis") # "Hello Luis"
say_greeting("Welcome", "Luis") # "Welcome Luis"

# *Splat operator

# 1 - Accept additional arguments

def say_hello_to(*users) 
    users.each { |user| say_greeting(user) }
end

say_hello_to("Merlin", "Jean", "Tiki")

puts "--------------------"

# 2 - Decompose arr

family = ["Luis", "Merlin"]
say_hello_to(*family)

# 3 - Double decompose hash. ***Only works with symbols as keys***

new_hash = {name:"luis", age:30}
new_new_hash = {**new_hash, location:"Tampa"}

puts new_new_hash

# Inject/Reduce

# puts [11, 7, 2, 4].inject { |acc, ele| acc + ele }
# # get max using inject
# arr_so = [10,22,11,98,45,-40]

# p [11, 7, 2, 4].inject do |acc, el|
#     if el < acc
#         el
#     else
#         acc
#     end
# end

# Global variables

$message = "Hello"

def say_message
    puts $message
end

say_message

# Constants

FOOD = "pho"
puts FOOD

# Blocks

[1,2,3].map { |el| -(el * 2)}

# Using methods with blocks

["a","b","c"].map { |str| str.upcase }
["a","b","c"].map(&:upcase)
[1,2,3].select(&:odd?)

# Procs

doubler = Proc.new { |num| num * 2}
p doubler.call(2)

is_even = Proc.new do |num|
    if num % 2 == 0
        true
    else
        false
    end
end

puts is_even.call(2) # True

# Passing proc to method

def add_and_proc(num_1, num_2, prc)
    sum = num_1 + num_2
    puts prc.call(sum)
end

negate = Proc.new { |num| -1 * num }
square = Proc.new { |num| num * num }


add_and_proc(1,2,square) #9
add_and_proc(5,5, negate) #-10

# Passing block to a method and convert to a proc

def new_add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2
    puts prc.call(sum)
end

new_add_and_proc(2,2) { |num| num * num } # 16 Doubler proc
new_add_and_proc(5,3) { |num| num % 2 == 0 } #true is even proc

# Using & to transform from prock to block

def new_add_sum_proc(num_1, num_2, &proc)
    puts proc.call(num_1 + num_2)
end

new_doubler = Proc.new { |num| num * 2}

new_add_sum_proc(1,2,&new_doubler) # 6

# another & example

newest_dobler = Proc.new { |num| num * 2 }
p [1,2,3,4,5].map(&newest_dobler) # [2,4,6,8,10]

# Classes

class Cat

    #class variable
    @@legs = 4

    def initialize(name, color, age)
        #instance variable
        @name = name
        @color = color
        @age = age
    end

    def get_name
        @name
    end

    def name=(name)
        @name = name
    end

    def get_color
        @color
    end

    def color=(color)
        @color = color
    end

    def get_age
        @age
    end

    def age=(age)
        @age = age
    end

end

cat_1 = Cat.new("Whiskers","White",5)

p cat_1.get_name

class Car

    #Class variable
    @@num_of_wheels = 4

    #Class constant. Cannot be changed!!!
    NUM_OF_DOORS = 4

    #Class method
    def self.upgrade_to_flying_cars
        @@num_of_wheels = 0
    end

    def initialize(color)
        #Instance variable
        @color = color
    end

    def num_wheels
        @@num_of_wheels
    end

    def get_doors_quantity
        NUM_OF_DOORS
    end
end

car_1 = Car.new("Red")
car_2 = Car.new("Black")

p car_1.num_wheels # 4
p car_2.num_wheels #4

Car.upgrade_to_flying_cars

p car_1.num_wheels #0

car_3 = Car.new("Blue")
p car_3.num_wheels # 0  the previous call to class method flying card changes each new class
p car_3.get_doors_quantity # 4

# Notation
# Instance method - Dog#speak
 # Class method - Dog::growl

 class Dog

    def initialize(name, bark)
        #instance variables
        @name = name
        @bark = bark
    end

    # Class method
    def self.growl
        "GRRRRR"
    end

    # Class method

    def self.whos_louder(dog_1, dog_2)
        return dog_1 if dog_1.bark.length > dog_2.bark.length
        dog_2
    end

    #instance methods
    def speak 
        @name + " says " + @bark
    end

    def name
        @name
    end

    def bark
        @bark
    end
 end

 my_dog = Dog.new("Fido", "woof")
 puts my_dog.speak # Fido says woof

 other_dog = Dog.new("Doge", "much bork")
 puts other_dog.speak # Doge says much bork

 p Dog.growl # "Grrr"

 puts Dog.whos_louder(my_dog, other_dog) == other_dog #true

 # Monkey patching

 class String

    def upcase?
        self == self.upcase
    end

 end

  p "HELLO".upcase? # true
 p "hello".upcase? #false

 class Integer
    def prime?
        return true if self < 2
        (2...self).each { |num| return false if self % num == 0 }
        true
    end
 end

 p 10.prime? #false
 p 7.prime? #true

 class Array
    def has_zero?
        self.each { |el| return true if el == 0 }
        false
    end

    # def has_zero?
    #     sef.include?(0)
    # end

 end

 p [0,1,2,3].has_zero? #true
 p [5,3,9].has_zero? #false

 # User-inputs

puts "Whats your name?"
name = gets.chomp
p "Hello" + " " + name

# attr_reader

class Dog

    # attr_reader will define #name and #age getters for us
    attr_reader :name, :age

    # attr_writer will define #name= and @age= setter for us
    attr_writer :name, :age

    # Will define both a getter and setter
    # attr_accessor :name, :age

    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food
    end

end

dog = Dog.new("Fido", 3, "Pizza")
puts dog.name #"Fido"
puts dog.age #3
# puts dog.favorite_food would give error


dog.name = "Luis"
dog.age = 5

puts dog.name #"Luis"
puts dog.age #5

# Recursion

def count_down(num)
    if num == 0
        puts "Houston, we have lift-off"
        return
    end
    puts num
    count_down(num - 1)
end

count_down(10)


def factorial(n)
    return 1 if n == 1
    n * factorial(n - 1)
end

puts factorial(5) #120

def fib(n)
    return 1 if n < 3
    fib(n - 1) + fib(n - 2)
end

puts fib(5) #5