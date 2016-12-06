defmodule SixTest do
  use ExUnit.Case

  test "gets the most frequent element of a list" do
    assert Six.most_frequent_element(["a", "d", "d"]) === "d"
  end

  test "frequencies produces a frequency map of inputs" do
    assert Six.frequencies([1, 2, 2, 3, 4, 3, 1, 1]) === [{1, 3}, {2, 2}, {3, 2}, {4, 1}]
  end

  test "generates list of nth characters" do
    assert Six.make_list_of_nth_characters(~w{abc bas cas}, 0) === ~w{a b c}
  end

  test "corrects the errors in the message" do
    assert Six.solve_day_6_part_one(["accd", "bbcd", "abce"]) === "abcd"
    assert Six.solve_day_6_part_one(["accde", "bbcde", "abcef"]) === "abcde"
    assert Six.solve_day_6_part_one(["aaaaaaab", "aaaaaaab", "aaaaaaaa"]) === "aaaaaaab"
  end

  test "gets the solution" do
    File.read!("inputs/six")
      |> String.trim
      |> String.split("\n")
      |> Six.solve_day_6_part_one
      |> IO.puts
  end
end
