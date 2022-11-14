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

end
