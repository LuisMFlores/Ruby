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