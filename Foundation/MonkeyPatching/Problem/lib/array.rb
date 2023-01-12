# Monkey-Patch Ruby's existing Array class to add your own custom methods

require "byebug"

class Array
  
    def span
        self.empty? ? nil : self.max - self.min
    end

    def average
        self.empty? ? nil : self.sum / (self.length * 1.0)
    end

    def median

        return nil if empty?

        median_idx = self.length / 2
        sorted = self.sort

        if self.length.even?
            sum = (sorted[median_idx - 1] + sorted[median_idx])
            sum / 2.0
        else
            sorted[median_idx]
        end

    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1 }
        hash
    end

    def my_count(val)
        count = 0
        self.each { |el| count += 1 if el == val}
        count
    end

    def my_index(val)
        self.each.with_index { |el, idx| return idx if el == val }
        nil
    end

    def my_uniq
        uniq_arr = []
        self.each { |el| uniq_arr << el if !uniq_arr.include?(el) } 
        uniq_arr
    end

    def my_transpose

        idx = 0

        transpose_arr = []

        while idx < self.length
            temp_arr = []
            self.each do |el|
                temp_arr << el[idx]
            end
            transpose_arr << temp_arr
            idx += 1
        end

        transpose_arr
    end

    def other_tranpose
    trans_arr = []

    self.each_with_index do |el1, idx1|
      temp_arr = []
      self.each_with_index do |el2, idx2|
        temp_arr << self[idx2][idx1]
      end
      transpose_arr << temp_arr
    end

    trans_arr

  end

end
