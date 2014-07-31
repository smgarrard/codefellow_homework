#!/usr/bin/env ruby


# HINT: Draw first, program second. Ask yourself the following questions:
#
#   What are the base cases?
#   How would I solve it by hand?
#   What patterns are emerging from my solution?
#   What are the operations within the pattern?
#   How do I know when to move on?
#   How do I know when to stop?


# A few methods that may help:

#   String#cut(match) → String
#
#     Returns a String of all occurances of match removed from the front.
#
#     "aabbcc".cut("a")   #=> "aa"
#     "aabbcc".cut("aa")  #=> "aa"
#     "aabbcc".cut("b")   #=> ""
#
#   String#[Range] → String
#
#     Returns a substring containing characters starting and finishing at the
#     Range's min and max.
#
#     "hello"[0..0]   #=> "h"
#     "hello"[0..1]   #=> "he"
#     "hello"[0..2]   #=> "hel"
#     "hello"[1..1]   #=> "e"
#     "hello"[1..2]   #=> "el"
#     "hello"[1..3]   #=> "ell"
#
#   String#empty? → true or false
#
#     Returns true if it's the empty String, otherwise false.
#
#     "".empty?   #=> true
#     "a".empty?  #=> false

class String
  def cut!(str)
    slice!(/^(#{str})*/)
  end
end

class RomToArab
  attr_accessor :input

  ROM_NUMS = {
    "M"  => 1000,
    "CM" => 900,
    "D"  => 500,
    "CD" => 400,
    "C"  => 100,
    "XC" => 90,
    "L"  => 50,
    "XL" => 40,
    "X"  => 10,
    "IX" => 9,
    "V"  => 5,
    "IV" => 4,
    "I"  => 1
  }

  def initialize(input)
    self.input = input
  end

  def convert_to_arabic
    num = input.upcase
    accum = 0
    ROM_NUMS.each do |roman, arabic|
      while num.start_with?(roman)  
        accum += arabic
        num.slice!(num[0..(roman.size-1)])
        return accum if num == ""
      end
    end
    return "Invalid roman numeral '#{input}'" unless num.empty?
  end  

end



# input = ARGV.first

# if input.nil?
  # puts "Usage: 5_arabic_numbers.rb ROMAN_NUMERAL"
  # exit
# end

# puts RomToArab.convert_to_arabic(input)

