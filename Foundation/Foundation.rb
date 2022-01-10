
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
