# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.



def peak_finder(nums_arr)
    nums_arr.select.with_index do |ele, idx|
        left_num = 0
        left_num = nums_arr[idx - 1] ? nums_arr[idx - 1] : 0 if idx != 0 
        right_num = nums_arr[idx + 1] ? nums_arr[idx + 1] : 0
        middle_num = ele
        is_peak?(left_num, middle_num, right_num)
    end
end

def is_peak?(left_num , middle_num, right_num)
    middle_num > left_num && middle_num > right_num
end

def other_pick_finder(arr)
    peaks = []

    arr.each_index do |idx|
        left_num = arr[idx - 1]
        middle_num = arr[idx]
        right_num = arr[idx + 1]

        if idx == 0 && middle_num > right_num
            peaks << middle_num
        elsif idx == arr.length - 1 && middle_num > left_num
            peaks << middle_num
        else
            peaks << middle_num if middle_num > left_num && middle_num > right_num
        end
    end

    peaks
end

p other_pick_finder([1, 3, 5, 4])         # => [5]
p other_pick_finder([4, 2, 3, 6, 10])     # => [4, 10]
p other_pick_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p other_pick_finder([1, 3])               # => [3]
p other_pick_finder([3, 1])               # => [3]
