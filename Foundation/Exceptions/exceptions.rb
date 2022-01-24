# Exceptions

num = 0

begin
    puts "Dividing 10 by #{num}"
    ans = 10 / num
    puts "The answer is #{ans}" 
rescue
    puts "There was an error with that division"
end

puts "---------"
puts "Program finished"

# Raise arguments

def format_name(first, last)
    raise "arguments must be strings" if !(first.instance_of?(String) || last.instance_of?(String))
    first.capitalize + " " + last.capitalize
end

puts format_name("Luis", "Manuel")
puts format_name(42, true)