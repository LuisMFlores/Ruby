# Enumerables

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