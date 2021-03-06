class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars_arr)
    chars_arr.all? { |ch| POSSIBLE_PEGS.has_key?(ch.upcase) }
  end

  def initialize(char_arr)
    raise "Not valid pegs!" if !Code.valid_pegs?(char_arr)
    @pegs = char_arr.map(&:upcase)
  end

  def self.random(len)
    rand_pegs = []
    pegs = POSSIBLE_PEGS.keys
    len.times { || rand_pegs << pegs.sample }
    Code.new(rand_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](idx)
    pegs[idx]
  end

  def length
    pegs.length
  end

  def num_exact_matches(code)
    c = 0
    code.pegs.each_with_index { |ch, i| c += 1 if ch == pegs[i] }
    c
  end

  def num_near_matches(code)
    c = 0
    code.pegs.each_with_index { |ch, i| c += 1 if pegs.include?(ch) && ch != pegs[i] }
    c
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
