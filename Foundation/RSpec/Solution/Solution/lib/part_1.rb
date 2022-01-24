def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(nums_arr)
    nums_arr.sum / nums_arr.length.to_f
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr_str = str.split(" ").map.with_index do |ele, idx|
        if idx.even?
            ele.upcase
        else
            ele.downcase
        end
    end

    arr_str.join(" ")
end