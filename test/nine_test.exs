defmodule NineTest do
  use ExUnit.Case

  test "calculates uncompressed length (example one)" do
    assert Nine.calculate_decompressed_lenght("ADVENT") === 6
  end

  test "calculates uncompressed length (example two)" do
    assert Nine.calculate_decompressed_lenght("CODE") === 4
  end

  test "decompresses a compressed message (no repetions, one marker ex one)" do
    compressed_message = "ABC(2x5)FA"
    assert Nine.decompress_message(compressed_message) === "ABCFAFAFAFAFA"
  end

  test "decompresses a compressed message (no repetions, one marker ex two)" do
    compressed_message = "ABC(2x3)FA"
    assert Nine.decompress_message(compressed_message) === "ABCFAFAFA"
  end

  test "decompresses a compressed message (fake marker)" do
    compressed_message = "(6x1)(1x3)A"
    assert Nine.decompress_message(compressed_message) === "(1x3)A"
  end

  test "decompresses a compressed message (another fake marker)" do
    compressed_message = "X(8x2)(3x3)ABCY"
    assert Nine.decompress_message(compressed_message) === "X(3x3)ABC(3x3)ABCY"
  end

@tag :wip
  test "solve part one" do
    input = File.read!("inputs/nine") |> String.trim
    Nine.decompress_message(input) |> String.length |> IO.inspect
  end

end
