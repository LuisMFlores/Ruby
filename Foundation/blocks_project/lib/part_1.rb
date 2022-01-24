require "byebug"

def select_even_nums(num_arr)
    num_arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |h| h["age"] < 3 }
end

def count_positive_subarrays(two_d_array)
    two_d_array.count { |arr_el| arr_el.sum > 0}
end

$vowels = "aeiou"

def aba_translate(str)
    str.each_char.inject("") { |acc, el| acc += transform_char(el) }
end

def transform_char(char)
    return char + "b" + char if $vowels.include?(char)
    char
end

def aba_array(arr)
    arr.map { |el| aba_translate(el) }
end