defmodule EightTest do
  use ExUnit.Case

  test "turns a one by one rectangle on" do
    screen = [false,false,   
              false,false]
    assert Eight.rectangle(screen, [turn_on: {1,1}, pixels_per_line: 2]) === [true,false,
                                                                              false,false]
  end

  test "turns a two by one rectangle on" do
    screen = [false,false,
              false,false]
    assert Eight.rectangle(screen, [turn_on: {2,1}, pixels_per_line: 2]) === [true,true,
                                                                              false,false]
  end

  test "turns a two by two rectangle on" do
    screen = [false,false,false,
              false,false,false]
    assert Eight.rectangle(screen, [turn_on: {2,2}, pixels_per_line: 3]) === [true,true,false,
                                                                              true,true,false]
  end

  test "rotates a column (shift one)" do
    screen = [true,true,
              false,false]
    assert Eight.rotate_column(screen, [column: 0, shift: 1], pixels_per_line: 2) === [false,true,
                                                                                      true,false]
  end

  test "rotates a column (shift two)" do
    screen = [true,false,
              false,false,
              false,false]
    assert Eight.rotate_column(screen, [column: 0, shift: 2], pixels_per_line: 2) === [false,false,
                                                                                       false,false,
                                                                                       true,false,]
  end

  test "rotates a column (shift four)" do
    screen = [false,true,
              false,false,
              false,false,
              false,false]
    assert Eight.rotate_column(screen, [column: 1, shift: 4], pixels_per_line: 2) === [false,true,
                                                                                       false,false,
                                                                                       false,false,
                                                                                       false,false]
  end

  test "rotates a row (shift one)" do
    screen = [true,false,
              false,false]
    assert Eight.rotate_row(screen, [row: 0, shift: 1], pixels_per_line: 2) === [false,true,
                                                                                 false,false]
  end

  test "rotates a row (shift two)" do
    screen = [true,false,
              true,false]
    assert Eight.rotate_row(screen, [row: 1, shift: 2], pixels_per_line: 2) === [true,false,
                                                                                 true,false]
  end

  test "rotates a row (shift two again)" do
    screen = [false,true,false,
              false,false,false,
              false,false,false]
    assert Eight.rotate_row(screen, [row: 0, shift: 2], pixels_per_line: 3) === [true,false,false,
                                                                                 false,false,false,
                                                                                 false,false,false]
  end

  test "rotates a row (shift three)" do
    screen = [false,true,false,
              true,false,true,
              false,false,false]
    assert Eight.rotate_row(screen, [row: 1, shift: 2], pixels_per_line: 3) === [false,true,false,
                                                                                 false,true,true,
                                                                                 false,false,false]
  end
  
  test "solves part one" do
    input = File.read!("inputs/eight") |> String.trim |> String.split("\n") 
    Eight.solve_day_eight_part_one(input) |> Enum.count(&(&1)) |> IO.inspect
  end

end
