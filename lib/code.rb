require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.map(&:upcase).all? { |el| Code::POSSIBLE_PEGS.has_key?(el) }
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  attr_reader :pegs

  def initialize(chars)
    raise "invalid pegs" if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    (0...code.length).count { |idx| code[idx] == @pegs[idx] }
  end

  def num_near_matches(code)

  current_pegs = @pegs.dup
  new_pegs = code.pegs.dup

  (0...current_pegs.length).each do |idx1|
    (0...current_pegs.length).each do |idx2|

      if current_pegs[idx1] == new_pegs[idx2] && idx1 == idx2
        current_pegs[idx1] = "X"
        new_pegs[idx1] = "X"
        break
      end
        
        if current_pegs[idx1] == new_pegs[idx2] && current_pegs[idx1] != new_pegs[idx1]
          current_pegs[idx1] = nil
          new_pegs[idx2] = nil
          break
        end

      end
    end

    @pegs.length - current_pegs.compact.length

  end

  def ==(code)
    self.pegs == code.pegs
  end

end