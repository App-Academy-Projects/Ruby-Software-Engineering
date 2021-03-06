# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    self.max - self.min if self.length > 0
  end

  def average
    self.sum / (1.0 * self.length) if self.length > 0
  end

  def median
    len = self.length
    sorted = self.sort
    if len > 0
        if len.odd?
            return sorted[len/2]
        else
            return [sorted[(len/2)-1], sorted[len/2]].average
        end
    end
  end

  def counts
    counts = Hash.new(0)
    self.each { |el| counts[el] += 1}
    return counts
  end

  def my_count(val)
    c = 0
    self.each { |el| c += 1 if val == el}
    c
  end

  def my_index(val)
    self.each_with_index { |el, idx| return idx if el == val}
    return nil
  end

  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el if !new_arr.include?(el)}
    new_arr
  end

  def my_transpose
    len = self.length
    new_arr = []
    (0...len).each do |i|
        nest_arr = []
        (0...self[i].length).each do |j|
            nest_arr << self[j][i]
        end
        new_arr << nest_arr
    end
    new_arr
  end
end
