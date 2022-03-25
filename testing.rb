require "byebug"

def permutations(arr)
    return [arr] if arr.length <= 1

    first = arr.shift
    perms = permutations(arr)
    # debugger
    possible_perms = []

    perms.each do |perm|
        (0..perm.length).each do |idx|
            possible_perms << perm[0...idx] + [first] + perm[idx..-1]
        end
    end

    possible_perms
end

p permutations([1,2,3])