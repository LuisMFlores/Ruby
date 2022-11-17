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

end
