# Common enumerables

# All?/any?/none?/one?/count/sum/max/min/flatten

puts [2,4,6].all? { |ele| ele.even? } # True
puts [1,2,2].any? { |ele| ele % 5 == 0 } # False
puts [1,3,5].none? { |ele| ele.even? } # true
puts [1,2,3].one? { |ele| ele == 2 } # True
puts [1,2,3,4,5,6,7,8,9,10].count { |ele| ele.even? } # 5
puts [1,-3,5].sum # 3
puts [1,2,3].min #1
puts [1,2,3].max #3
puts [[1,2,3],[4,5],6].flatten # [1,2,3,4,5,6]