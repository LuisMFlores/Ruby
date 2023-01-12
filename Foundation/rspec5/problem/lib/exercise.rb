require "byebug"

def zip(*arrays)
    arrs = Array.new(arrays.first.length) { Array.new(arrays.length) }

    arrays.each_with_index do |arr, idx|
        arr.each_with_index do |num, in_idx|
            arrs[in_idx][idx] = num
        end
    end

    arrs
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |el| prc_1.call(el) != prc_2.call(el) }
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |idx|
        arrays.map do |el|
            el[idx]
        end
    end
end

def maximum(array, &prc)
    return nil if array.empty?
    array.inject(array.first) { |acc,el| prc.call(el) >= prc.call(acc) ? el : acc }
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h,k| h[k] = [] }
    arr.each { |el| hash[prc.call(el)] << el }
    hash
end

def max_tie_breaker(arr, prc, &blc)

    return nil if arr.empty?

    arr.inject(arr.first) do |acc, el|
        blc_call_el = blc.call(el)
        blc_call_acc = blc.call(acc)
        el_is_max_breaker = blc_call_el <=> blc_call_acc

        if el_is_max_breaker == 1
            el
        elsif el_is_max_breaker == 0
            # Tie
            prc_call_el = prc.call(el)
            prc_call_acc = prc.call(acc)
            el_is_max_breaker = prc_call_el <=> prc_call_acc

            if el_is_max_breaker == 1
                el
            else
                acc
            end

        else
            acc
        end
    end
end

VOWELS = "aeiou"

def silly_syllables(sent)
    sent.split(" ").map { |el| word_removable(el) }.join(" ")
end

def word_removable(sent)
    return sent if sent.chars.count { |el| VOWELS.include?(el)} < 2

    first_vowel_idx = 0
    (0...sent.length).each do |idx|
        if VOWELS.include?(sent[idx])
            first_vowel_idx = idx
            break
        end
    end

    last_vowel_idx = 0

    (sent.length - 1).downto(0).each do |idx|
        if VOWELS.include?(sent[idx])
            last_vowel_idx = idx
            break
        end
    end

    sent[first_vowel_idx..last_vowel_idx]
end