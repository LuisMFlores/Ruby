# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array

  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum.to_f / self.length
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    return sorted[sorted.length / 2] if !sorted.length.even?
    (sorted[sorted.length / 2] + sorted[sorted.length / 2 - 1]) / 2.0
  end

  def counts
    count_hash = Hash.new(0)
    self.each { |el| count_hash[el] += 1 }
    count_hash
  end

  def my_count(item)
    count = 0
    self.each { |el| count += 1 if item == el }
    count
  end

  def my_index(item)
    self.each_with_index { |el, idx| return idx if item == el }
    nil
  end

  def my_uniq
    uniq_arr = []
    self.each { |el| uniq_arr << el if !uniq_arr.include?(el) }
    uniq_arr
  end

  def my_transpose
    transpose_arr = []
    self.length.times do |num|
        temp_arr = []
        self.each do |arr_el|
            # debugger
            temp_arr << arr_el.shift
        end
        transpose_arr << temp_arr
    end
    transpose_arr
  end

end
