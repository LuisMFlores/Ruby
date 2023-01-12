def is_prime?(n)
    return false if n < 2
    (2...n).none? { |num| n % num == 0 }
end

def nth_prime(n)
    count = 0
    num = 0

    while count < n
        num += 1
        count += 1 if is_prime?(num)
    end

    num 
end

def prime_range(min, max)
    prc = Proc.new { |num| is_prime?(num) }
    (min..max).select(&prc)
    
end