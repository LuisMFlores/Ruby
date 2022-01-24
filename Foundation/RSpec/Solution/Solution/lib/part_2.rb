$vowels = "aeiou"
$alphabet = ("a".."z").to_a
$alphabet_length = $alphabet.length

def hipsterfy(word)
    last_char_idx = 0
    word.each_char.with_index { |el, idx| last_char_idx = idx if $vowels.include?(el) }
    word[last_char_idx] = "" if last_char_idx != 0
    word
end

# Better choice since we start from the back
### would suggest checking for string include in vowles and return early ###
# def hipsterfy(word)
#   vowels = "aeiou"

#   i = word.length - 1
#   while i >= 0
#     if vowels.include?(word[i])
#       return word[0...i] + word[i+1..-1]
#     end

#     i -= 1
#   end

#   word
# end

def vowel_counts(str)
    char_hash = Hash.new(0)
    str.downcase.split("").each { |el| char_hash[el] += 1 if $vowels.include?(el) }
    char_hash
end

def caesar_cipher(str, num)
    str.each_char.map do |el| 
        if $alphabet.include?(el)
            $alphabet[($alphabet.index(el) + num) % $alphabet_length]
        else
            el
        end
    end.join("")
end