require "byebug"

def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] < 3 }
end

def count_positive_subarrays(arr)
    arr.count { |el| el.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    word.each_char.map { |char| vowels.include?(char) ? "#{char}b#{char}" : char }.join("")
end

def aba_array(arr)
    arr.map {|ele| aba_translate(ele) }
end