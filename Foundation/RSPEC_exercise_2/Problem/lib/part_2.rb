def palindrome?(str)
    str.each_char.with_index do |char, idx|
        return false if char != str[-1 - idx]
    end

    true
end

def substrings(str)

    subs = []

    (0..str.length - 1).each do |idx1|
        (idx1..str.length - 1).each do |idx2|
            subs << str[idx1..idx2]
        end
    end

    subs
end

def palindrome_substrings(str)
    substrings(str).select { |sub| sub.length > 1 && palindrome?(sub) }
end