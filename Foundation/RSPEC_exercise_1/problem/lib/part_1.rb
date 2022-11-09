def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / Float(arr.length)
end

def repeat(word,num)
    word * num 
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    sent.split(" ").map.with_index { |ele,idx| idx.even? ? ele.upcase : ele.downcase }.join(" ")
end