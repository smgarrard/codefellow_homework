require "minitest/autorun"
require_relative "5_arabic_numbers"
system("clear")

class TestMeme < Minitest::Test

  def test_1999
    a = RomToArab.new("mcmxcix")
    assert_equal 1999, a.convert_to_arabic
  end

  def test_444
    a = RomToArab.new("CDXLIV")
    assert_equal 444, a.convert_to_arabic 
  end

  def test_350
    a = RomToArab.new("CCCL")
    assert_equal 350, a.convert_to_arabic 
  end

  def test_reject_invalid_numerals
    #raise exception
    a = RomToArab.new("bigboi")
    assert_equal "Invalid roman numeral 'bigboi'", a.convert_to_arabic
  end

end