VOWELS = "aeiou"

def hipsterfy(word)

    i = word.length - 1

    while i >= 0
        if VOWELS.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end

    word
end

def vowel_counts(str)
    vowel_hash = Hash.new(0)

    str.downcase.each_char { |char| vowel_hash[char] += 1 if VOWELS.include?(char) }

    vowel_hash
end

ALPHABET = ("a".."z").to_a

def caesar_cipher(message, num)
    new_message = ""

    message.each_char do |char|
        new_message += ALPHABET.include?(char) ? shifted_char(char, num) : char
    end

    new_message
end

private def shifted_char(char, shift_amount)
    shift_idx = ALPHABET.index(char) + shift_amount
    ALPHABET[shift_idx % 26]
end