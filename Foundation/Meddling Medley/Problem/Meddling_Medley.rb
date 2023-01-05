require "byebug"

def duos(str)
    (0...str.length - 1).count { |i| str[i] == str[i + 1] }
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

def sentence_swap(sent, hash)
    sent.split(" ").map { |word| hash.has_key?(word) ? hash[word] : word }.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

def hash_mapped(hash, proc, &blc)
    mapped_hash = {}

    hash.each { |k,v| mapped_hash[blc.call(k)] = proc.call(v) }

    mapped_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

def counted_characters(sent)
    hash = Hash.new(0)
    sent.each_char { |char| hash[char] += 1 }
    hash.select { |k,v| v > 2 }.keys
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

def triplet_true(str)
    (0...str.length - 2).each { |i| return true if str[i] == str[i + 1] && str[i] == str[i + 2] }
    false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

def energetic_encoding(str, hash)
    str.each_char.map { |char| hash.has_key?(char) ? hash[char] : char == " " ? " " : "?" }.join
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    new_str = ""
    (0...str.length).each do |i| 
        !i.even? ? next : new_str += str[i] * str[i + 1].to_i
    end
    new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *procs)
    arr.select { |ele| procs.all? { |proc| proc.call(ele) } }
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

VOWELS = "aeiou"

def convert_pig_latin(sent)
    sent_arr = sent.split(" ")
    sent_arr.map do |word|
        length = word.length

        if length < 3
            word
        else
            if VOWELS.include?(word[0].downcase)
                word + "yay"
            else
                latin_pig(word) + "yay"
            end
        end

    end.join(" ")
end

def latin_pig(word)
    first_vowel_i = 0
    (0...word.length).each do |i|
        first_vowel_i = i
        if VOWELS.include?(word[i])
            break
        end
    end

    new_word = word[first_vowel_i..-1] + word[0...first_vowel_i]
    word[0].capitalize == word[0] ? new_word.capitalize : new_word
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    sent_arr = sent.split(" ")

    sent_arr.map do |word|

        if word.length < 3
            word
        else
            if VOWELS.include?(word[-1].downcase)
                word + word.downcase
            else
                reverberate_word(word)
            end
        end

    end.join(" ")
end

def reverberate_word(word)

    last_vowel_idx = 0

    (word.length - 1).downto(0).each do |i|
        last_vowel_idx = i
        if VOWELS.include?(word[i].downcase)
            break
        end
    end

    new_word = word + word[last_vowel_idx..-1]

    word[0].capitalize == word[0] ? new_word.capitalize : new_word

end

puts
puts

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *procs)
    arr.select { |el| procs.any? { |proc| proc.call(el)} }
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    sent.split(" ").map.with_index do |word,idx|
        if idx.even?
            remove_vowel(word)
        else
            remove_vowel(word, true)
        end

    end.join(" ")
end

def remove_vowel(word, last_vowel = false)
    find_vowel_idx = 0 

    (0...word.length).each do |i|
        if VOWELS.include?(word[i])
            find_vowel_idx = i
            break if !last_vowel
        end
    end

    return word if !VOWELS.include?(word[find_vowel_idx])

    word[0...find_vowel_idx] + word[find_vowel_idx + 1..-1]
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    sent.split(" ").map do |word|
        if VOWELS.include?(word[-1])
            word + word[-1]
        else
            convert_word(word)
        end
    end.join(" ")
end

def convert_word(word)
    new_word = word.chars.map { |char| VOWELS.include?(char.downcase) ? char + "b" + char.downcase : char }.join("")
    word.capitalize == word[0].upcase ? new_word.capitalize : new_word
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(word)
    new_word = ""
    current_streak_char = []


    word.each_char.with_index do |current_char, idx|
        if current_streak_char.empty?
            current_streak_char << current_char
            next
        end

        if current_streak_char.last != current_char
            length = current_streak_char.length == 1 ? "" : current_streak_char.length
            new_word += current_streak_char.last + length.to_s
            current_streak_char = [current_char]
        else
            current_streak_char << current_char
        end

        if idx == word.length - 1
            length = current_streak_char.length == 1 ? "" : current_streak_char.length
            new_word += current_streak_char.last + length.to_s
        end

    end

    new_word
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"