
def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    sent.split(" ").map(&prc).join(" ")
end

def greater_proc_value(num, prc1, prc2)
    val_1 = prc1.call(num)
    val_2 = prc2.call(num)
    val_1 > val_2 ? val_1 : val_2
end

def and_selector(arr, prc1, prc2)
    arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index { |ele, idx| idx.even? ? prc1.call(ele) : prc2.call(ele) }
end
