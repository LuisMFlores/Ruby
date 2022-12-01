require "byebug"

def my_reject(arr, &prc)
    arr.select { |el| !prc.call(el) }
end

def my_one?(arr, &prc)
    arr.count(&prc) == 1
end

def hash_select(hash, &prc)
    unique_hash = {}
    hash.each { |k,v| unique_hash[k] = v if prc.call(k,v) }
    unique_hash
end

def xor_select(arr, prc_1, prc_2)
    arr.select { |el| (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el))}
end

def proc_count(v, procs)
    procs.count { |proc| proc.call(v) }
end