require "byebug"

def factorial(n)
    return 1 if n == 0
    n * factorial(n-1)
end

def reverse_str(str)
    return "" if str == ""
    str[-1] + reverse_sent(str[0...-1])
end

def upcase(str)
    return "" if str == ""
    str[0].upcase + upcase(str[1..-1])
end

def reverse(str)
    return "" if str == ""
    reverse(str[1..-1]) + str[0]
end

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot_arr = [arr.first]
    puts arr[1..-1]
    left_side = arr[1..-1].select { |el| el < arr.first }
    right_side = arr[1..-1].select { |el| el >= arr.first }
    quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

class Array

    def quick_sort
        return self.dup if self.length <= 1
        pivot_el = self.first
        left_side = self.drop(1).select { |el| el < pivot_el }.quick_sort
        right_side = self.drop(1).select { |el| el >= pivot_el }.quick_sort
        left_side + [pivot_el] + right_side
    end

end