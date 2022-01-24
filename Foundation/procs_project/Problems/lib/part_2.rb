def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    str.split(" ").map(&prc).join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    first_num = proc_1.call(num)
    second_num = proc_2.call(num)
    return first_num if first_num > second_num
    second_num
end

def and_selector(arr, proc_1, proc_2)
    new_arr = []
    arr.each { |el| new_arr << el if proc_1.call(el) && proc_2.call(el) }
    new_arr
end

def alternating_mapper(arr, proc_1, proc_2)
    new_arr = []
    arr.each_with_index do |el, idx|
        if idx.even?
            new_arr << proc_1.call(el)
        else
            new_arr << proc_2.call(el)
        end
    end
    new_arr
end