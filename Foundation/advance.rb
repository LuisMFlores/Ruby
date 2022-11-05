# Enumerables

puts [2,4,6,7,13,21,100].all? { |el| el.even? } # false
puts [3, 9, 15].all? { |el| !el.even? } # true

puts [1,2,3,4,5].any? { |el| el > 4 } # true
puts "hello".split("").any? { |el| el.upcase == el } # false

puts [3, 9, 15].none? { |el| el.even? } # true
puts [1,2,3,4,5].none? { |el| el < 2 } # false

puts [1,1,1,4,5].one? { |el| el < 2 } # false
puts [1,2,3,4,5].one? { |el| el == 1 } # true

puts [1,2,3,4,5].count { |el| el.even? } #2
puts "hello".split("").count {|el| el == "l" } #2

puts [1,2,3,4].sum # 10

puts [1,2,3].max # 10
puts [1,2,3].min # 1

p [].min #nil


multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]