# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    current_char = []

    str.each_char do |char|
        if current_char.last == char
            current_char << char
        else
            new_str += compress_str_char(current_char)
            current_char = [char]
        end
    end
    
    new_str += compress_str_char(current_char)

    new_str
end

def compress_str_char(chars)
    num = chars.length > 1 ? chars.length : ""
    "#{num}#{chars.last}"
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
