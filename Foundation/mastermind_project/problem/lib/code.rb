require "byebug"

class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(length)
    samples = []
    length.times { |num| samples << POSSIBLE_PEGS.keys.sample }
    Code.new(samples)
  end

  # more consience code 
  # def self.random(length)
  #   Code.new(Array.new(length){ POSSIBLE_PEGS.keys.sample})
  # end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def initialize(chars)
    raise "Array does not contain valid chars" if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    (0...@pegs.length).count{ |idx| @pegs[idx] == code.pegs[idx]}
  end

  def num_near_matches(code)
    count = 0
    (0...@pegs.length).each do |current_idx|
      next_idx = current_idx + 1
      next if next_idx >= @pegs.length || @pegs[current_idx] == code.pegs[current_idx] # This means we are beyond the array or its a exact match.
      (0...@pegs.length).each do |previous_current_future_idx|
        # debugger
        if @pegs[current_idx] == code.pegs[previous_current_future_idx] && @pegs[previous_current_future_idx] != code.pegs[previous_current_future_idx]
          count += 1
          break
        end
      end
    end

    count
  end

  # Cleaner solution
  
  #  def num_near_matches(guess_code)
  #   code_dup = self.pegs.dup
  #   guess_dup = guess_code.pegs.dup

  #   guess_dup.each_with_index do |peg, i|
  #     if peg == code_dup[i]
  #       code_dup[i] = nil
  #       guess_dup[i] = nil
  #     end
  #     debugger
  #   end
  #   code_dup.delete(nil)
  #   guess_dup.delete(nil)

  #   count = 0
  #   guess_dup.each_with_index do |peg, i|
  #     if code_dup.include?(peg)
  #       count += 1
  #       code_dup.delete_at(code_dup.index(peg))
  #     end
  #   end
  #   count
  # end

  def ==(code)
    @pegs == code.pegs
  end

end
