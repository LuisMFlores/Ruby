require "byebug"

def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
    end_str = [".com", ".net", ".io", ".org" ]
    arr.none? { |url| end_str.any? { |ending| url.end_with?(ending)} }
end

def any_passing_students?(arr)
    arr.any? { |hash| average_grade(hash[:grades]) > 80}
end

private def average_grade(arr)
    arr.sum / arr.length * 1.0
end
