defmodule SixTest do
  use ExUnit.Case

  test "detects abba example one" do
    assert Seven.has_abba?("abba") === true
  end

  test "detects abba example two" do
    assert Seven.has_abba?("fewasjkkjasdf") === true
  end

  test "detects abba example three" do
    assert Seven.has_abba?("fewasjpkjasdf") === false
  end

  test "extracts content in square brackets example one" do 
    assert Seven.get_content_in_square_brackets("[a]bc[def]ghi[lm]n[o]") === ["a", "def", "lm", "o"]
  end

  test "extracts content in square brackets example two" do 
    assert Seven.get_content_in_square_brackets("abc[gg]ghi[zz]no") === ["gg", "zz"]
  end

  test "cleans the square brackets sections from an ipv7 address" do
    assert Seven.get_content_outside_square_brackets("bc[gg]ghi[zz]no") === ["bc", "ghi", "no"]
  end

  test "detects a string that supports SSL" do
    assert Seven.supportsSSL?("aaa[aaa]xyz") === false    
  end 

  test "detects a string that supports TLS" do
    assert Seven.supportsTLS?("abba[mnop]qrst") === true    
  end 

  test "detects a string that supports TLS again" do
    assert Seven.supportsTLS?("ioxxoj[asdfgh]zxcvbn") === true    
  end

  test "detects a string that does not support TLS" do
    assert Seven.supportsTLS?("aaaa[qwer]tyui") === false    
  end 

  test "detects a string that does not support TLS again" do
    assert Seven.supportsTLS?("ab[nkdsl]cd[bddb]xyyx") === false    
  end 

  test "solves part one" do
    input = File.read!("inputs/seven")
    IO.puts inspect Seven.solve_day_seven_part_one(input)
  end

#  test "solves part two" do
#    input = File.read!("inputs/seven")
#    IO.puts Seven.solve_day_seven_part_two(input)
#  end

end
