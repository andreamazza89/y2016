defmodule FiveTest do
  use ExUnit.Case

  test "extracts the most significant digit when there are 5 leading 0s" do
    assert Five.five_zeroes?('000004asgsdg') === {true, '4'}
  end

  test "recognises a non-valid sequence" do
    assert Five.five_zeroes?('005004asgsdg') === false
  end

  test "collates a list of of numbers that match the criterion" do
    assert Five.solve_day_five_part_one('abc') === "18F47A30"
  end

end
