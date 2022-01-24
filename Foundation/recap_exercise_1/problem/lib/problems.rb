require "byebug"

# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#

# convert all words into a hash where all chars are keys

# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pair_arr = []
    current_idx = 0
    while current_idx < words.length
        ((current_idx + 1)...words.length).each do |idx|
            next if current_idx == idx
            pair_arr << [words[current_idx],words[idx]].join(" ") if convert_word_into_keys(words[current_idx], words[idx]).length == 5
        end
        current_idx += 1
    end
    pair_arr
end

VOWELS = "aeiou"
def convert_word_into_keys(word_1, word_2)
    hash = Hash.new(0)
    word_1.each_char { |char| hash[char] = 1 if VOWELS.include?(char)}
    word_2.each_char { |char| hash[char] = 1 if VOWELS.include?(char)}
    hash.keys
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |el| return true if num % el == 0 }
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bia = bigrams.select { |biagram| str.include?(biagram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k,v| k == v }
        selected = {}
        self.each { |k,v| selected[k] = v if prc.call(k,v) }
        selected
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]

    # create substring arr var
    # create idx var
    # loop thru the entire array
    # append index value with given length to substring arr var

    # return substring var

    def substrings(length = nil)
        substring_arr = []
        idx = 0
        while idx < self.length
           if length
            substring = self[idx...idx+length]
            substring_arr << substring if substring.length == length
           else
            next_idx = idx
            while next_idx < self.length
                substring = self[idx..next_idx]
                substring_arr << substring
                next_idx += 1
            end
           end
            idx += 1
        end
        substring_arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"

    ALPHABET = ("a".."z").to_a
    def caesar_cipher(num)
        self.each_char.map do |char|
           ALPHABET[(ALPHABET.index(char) + num) % ALPHABET.length]
        end.join
    end
end
