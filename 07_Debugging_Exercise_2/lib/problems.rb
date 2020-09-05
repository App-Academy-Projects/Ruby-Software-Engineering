# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    require 'prime'
    num.downto(2) do |factor|
        #debugger
        return factor if num % factor == 0 && factor.prime?
    end 
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char { |ch| hash[ch] += 1}

    return true if hash.none? { |k, v| v > 1 }
    return false
end