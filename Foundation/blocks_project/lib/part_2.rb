def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize}
end

def no_valid_url?(url_arr)
    url_arr.none? { |url| url.end_with?(".com", ".net", ".io", ".org")}
end

def any_passing_students?(hash_arr)
    hash_arr.any? { |hash| hash[:grades].sum / hash[:grades].length >= 75 }
end