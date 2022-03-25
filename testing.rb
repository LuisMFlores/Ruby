
require "byebug"

# Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_arr(arr)
    return 0 if arr.empty?
    arr.pop + sum_arr(arr)
end

puts sum_arr([1,2,3])

# Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.

def search_for_v(arr, v)
    return false if arr.empty?
    return true if arr[-1] == v
    search_for_v(arr[0...-1], v)
end

p search_for_v([1,2,3], 0)

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def count_uns_arr(arr, target)
    return 0 if arr.empty?
    (arr.first == target ? 1 : 0) + count_uns_arr(arr.drop(1), target)
end

p count_uns_arr([1,2,3,1,1], 0)

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def adds_to_12(arr)
    return false if arr.length <= 1
    arr.first + arr[1] == 12 ? true : adds_to_12(arr.drop(1))
end

p adds_to_12([1,6,1,1])

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(arr)
    return true if arr.length <= 1
    arr[0] > arr[1] ? false : sorted?(arr.drop(1))
end

p sorted?([1,2,3,4,5])
p sorted?([4,2,1])

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!

def reverse(str)
    return "" if str.empty?
    str[-1] + reverse(str[0...-1])
end

p reverse("Luima")