require "byebug"

def pair_nums_evaluation(nums, &prc)
    (0...nums.length - 1).count do |idx|
        (idx + 1...nums.length).one? do |nxt_idx|
            prc.call(nums[idx], nums[nxt_idx])
        end 
    end
end

def strange_sums(nums)
    prc = Proc.new { |num_1, num_2| num_1 + num_2 == 0 }
    pair_nums_evaluation(nums, &prc)
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

def pair_product(nums, product)
    prc = Proc.new { |num_1, num_2| num_1 * num_2 == product }
    pair_nums_evaluation(nums, &prc) > 0 ? true : false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    str.chars.map { |char| hash.has_key?(char) ? char * hash[char] : char }.join("")
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)

    (0..num).each do |n|
        return true if n * n == num
    end

    false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

def num_of_factors(num)
    (1..num).count { |n| num % n == 0 }
end

def anti_prime?(num)
    num_factors = num_of_factors(num)
    prc = Proc.new { |num1| num_factors > num_of_factors(num1) }
    (1...num).all?(&prc)
end

puts "-----"
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

# def matrix_addition(matrix_1, matrix_2)
#     length = matrix_1.length

#     new_matrix = Array.new(length) { [] }

#     (0...length).each do |idx|
#         sum = []

#         (0...matrix_1[idx].length).each do |other_idx|
#            sum << matrix_1[idx][other_idx] + matrix_2[idx][other_idx]
#         end

#         new_matrix[idx] = sum
#     end

#     new_matrix

# end

def matrix_addition(m1, m2)
    height = m1.length
    width = m1[0].length
    new_m = Array.new(height) { [0] * width }

    (0...height).each do |row|
        (0...width).each do |col|
            new_m[row][col] = m1[row][col] + m2[row][col]
        end
    end

    new_m

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    (1..nums.max).select { |factor| nums.all? { |n| n % factor == 0 } }
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    tribonacci_arr = [1,1,2]
    
    while tribonacci_arr.length < num
        tribonacci_arr << tribonacci_arr[-1] + tribonacci_arr[-2] + tribonacci_arr[-3]
    end

    num > 3 ? tribonacci_arr.last : tribonacci_arr.take(num).last

end


p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

def matrix_addition_reloaded(*ms)
    lengths = ms.map(&:length)
    return nil if !lengths.all? { |el| lengths.first == el }

    ms.inject { |m1, m2| matrix_addition(m1, m2) }

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)

    return true if matrix.any? { |row| row.all? { |el| el == row.first } }
    height = matrix.length
    width = matrix.first.length


    (0...height).each do |row|
        matrix_col = []
        (0...width).each do |col|
            matrix_col << matrix[col][row]
        end
        return true if matrix_col.all? { |el| matrix_col.first == el }
    end

    false

end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

def squaragonal?(matrix)
    top_left_to_right_bottom_idxs = [[matrix.length - 1, matrix.first.length - 1]]
    top_left_to_right_bottom_value = matrix[top_left_to_right_bottom_idxs.last.first][top_left_to_right_bottom_idxs.last.last]
    top_right_to_left_bottom_idxs = [[0, matrix.length - 1]]
    top_right_to_left_bottom_value = matrix[top_right_to_left_bottom_idxs.last.first][top_right_to_left_bottom_idxs.last.last]

    (matrix.first.length - 1).times do |el|
        row = top_left_to_right_bottom_idxs.last.first
        col = top_left_to_right_bottom_idxs.last.last
        top_left_to_right_bottom_idxs << [row - 1, col - 1]

        row = top_right_to_left_bottom_idxs.last.first
        col = top_left_to_right_bottom_idxs.last.last
        top_right_to_left_bottom_idxs << [row + 1, col - 1]
    end

    prc = Proc.new do |el|
        value = matrix[el.first][el.last]
        value == top_left_to_right_bottom_value || value == top_right_to_left_bottom_value
    end

    [top_left_to_right_bottom_idxs, top_right_to_left_bottom_idxs].each do |el|
        return true if el.all?(&prc)
    end

    false

end

puts "-----------"

    p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# def adjacent_sums(arr)
#     new_arr = []
#     (0...arr.length).each do |idx|
        
#         left_ele = idx == 0 ? 0 : arr[idx - 1]
#         middle_ele = arr[idx]
#         new_arr << left_ele + middle_ele

#     end

#     new_arr << arr.last

#     new_arr
# end

# def pascals_triangle(num)
#     arr = [[1]]
#     while arr.length < num 
#         arr << adjacent_sums(arr.last)
#     end
#     arr
# end

def sum_adjacent(arr)
    sum = []
    (0...arr.length - 1).each do |idx|
        sum << arr[idx] + arr[idx + 1]
    end
    sum
end

def pascals_triangle(num)
    triangle = [[1]]

    while triangle.length < num
        next_section = [1]
        next_section += sum_adjacent(triangle.last)
        next_section << 1
        triangle << next_section
    end

    triangle
end


p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def prime?(num)
    return false if num < 2
    (2...num).each { |n| return false if num % n == 0 }
    true
end

def mersenne?(num)
    i = 2
    eq = -1
    until eq > num
        eq = 2 ** i - 1
        return true if eq == num 
        i += 1
    end
    false
end

def mersenne_prime(num)
    mpns = []
    i = 1
    while mpns.length < num
        mpns << i if mersenne?(i) && prime?(i)
        i += 1
    end

    mpns.last
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

def triangle_num(i)
    (i * (i + 1)) / 2
end

ALPHABET = ("a".."z").to_a

def encoder(word)
    word.each_char.map { |char| ALPHABET.index(char) + 1 }.sum
end

def triangular_word?(word)
    encoded_word_num = encoder(word)
    i = 0
    until i > encoded_word_num
        return true if encoded_word_num == triangle_num(i)
        i += 1
    end
    false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

def is_consecutive?(num1, num2)
    return false if num1.nil? || num2.nil?
    num1 + 1 == num2 || num2 + 1 == num1
end

def consecutive_collapse(arr)

    collapsed = false

    while !collapsed
        collapsed = true

        (0...arr.length - 1).each do |idx|

            if is_consecutive?(arr[idx], arr[idx + 1])
                collapsed = false
                arr = arr[0...idx] + arr[(idx + 1 + 1)..-1]
                break
            end

        end
    end

    arr

end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def prime?(num)
    return false if num < 2
    (2...num).each { |n| return false if num % n == 0 }
    true
end

def get_prime(start, nth)
    count = start
    prime = []

    if nth > 0
        count += 1
        while prime.length < nth
            prime << count if prime?(count)
            count += 1
        end

        prime.empty? ? nil : prime.last
    else
        count -= 1
        while prime.length < -(nth)
            prime << count if prime?(count)
            count -= 1
            return nil if count < 0
        end

        prime.empty? ? nil : prime.last
    end

end

def pretentious_primes(arr, num)
    arr.map { |el| get_prime(el, num) }
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]