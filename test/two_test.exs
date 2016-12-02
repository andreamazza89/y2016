defmodule TwoTest do
  use ExUnit.Case

  describe "one step" do

    test "moves up" do
      assert Two.move_on_keypad('U', {:start_from, 5}) === 2 
    end

    test "moves right" do
      assert Two.move_on_keypad('R', {:start_from, 5}) === 6
    end

    test "moves left" do
      assert Two.move_on_keypad('L', {:start_from, 5}) === 4
    end

    test "moves down" do
      assert Two.move_on_keypad('D', {:start_from, 5}) === 8
    end

    test "multiple moves" do
      assert Two.move_on_keypad('DR', {:start_from, 5}) === 9
    end

  end

end
