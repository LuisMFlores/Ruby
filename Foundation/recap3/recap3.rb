require "byebug"

def no_dupes?(arr)
    hash = Hash.new(0)

    arr.each { |el| hash[el] += 1 }

    hash.keys.select { |k| hash[k] == 1 }
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])      # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1] }
    true
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h,k| h[k] = [] }
    str.each_char.with_index { |c, i| hash[c] << i }
    hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    longest_streak = ""
    current_streak = ""

    str.each_char do |char|
        if current_streak[-1] == char || current_streak.empty?
            current_streak += char
        else
            current_streak = char
        end

        longest_streak = current_streak if current_streak.length >= longest_streak.length
    end
    
    longest_streak

end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    factorials = num_factorial(num)
    factorials.each { |fact| return true if factorials.include?(num / fact)}
    false
end

private def prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num % factor == 0 }
end

private def num_factorial(num)
    (2...num).select { |factorial| num % factorial == 0 && prime?(factorial) }
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

ALPHABET = ("a".."z").to_a

def vigenere_cipher(str, arr)
    str.each_char.map.with_index do |char, idx|
        ALPHABET.include?(char) ? cipher_char(char,arr[idx % arr.length]) : char
    end.join("")
end

def cipher_char(char, num)
    ALPHABET[(ALPHABET.index(char) + num) % 26]
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

VOWELS = "aeiou"

def vowel_rotate(str)
    vowels_arr = str.chars.select { |char| VOWELS.include?(char) }.rotate(-1)
    str.chars.map { |char| VOWELS.include?(char) ? vowels_arr.shift : char }.join("")
end

# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        return "" if prc.nil?
        str = ""
        self.each_char { |char| str += char if prc.call(char) }
        str
    end

    def map!(&prc)
        (0...self.length).each { |idx| self[idx] = prc.call(self[idx], idx)}
    end

end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""


# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

def multiply(num, multiplier)
    return 0 if multiplier == 0
    if multiplier < 0
        -(num + multiply(num, -(multiplier) - 1))
    else
        num + multiply(num, multiplier - 1)
    end
end

# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    return [] if n == 0
    return [2]if n == 1
    return [2,1] if n == 2

    lucas_seq = lucas_sequence(n - 1)
    lucas_seq << lucas_seq[-2] + lucas_seq[-1]
    lucas_seq
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(n)

    (2...n).each do |fact|
        if n % fact == 0
            other_fact = n / fact
            return [*prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end

    [n]
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]