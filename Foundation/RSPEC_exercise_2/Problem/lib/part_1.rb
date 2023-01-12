def partition(arr, num)

    greater_than_arr = []
    less_than_arr = []

    arr.each do |ele|
        if ele >= num
            greater_than_arr << ele
        else
            less_than_arr << ele
        end
    end

    [less_than_arr, greater_than_arr]
end

def merge(hash_one, hash_two)
    merge_hash = Hash.new(0)
    
    hash_one.each { |k,v| merge_hash[k] = v }
    hash_two.each { |k,v| merge_hash[k] = v}

    merge_hash
end

def censor(sent, arr)
    sent.split(" ").map { |word| arr.include?(word.downcase) ? replace_vowel(word) : word }.join(" ")
end

VOWELS = "aeiou"

private def replace_vowel(word)
    word.each_char.map { |char| VOWELS.include?(char.downcase) ? "*" : char }.join("")
end

def power_of_two?(num)

    divisor = 1

    while divisor < num
        divisor *= 2
    end

    divisor == num

end