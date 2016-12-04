defmodule FourTest do
  use ExUnit.Case

  test "recognises a real one-lettered room" do
    assert Four.is_room_real?("a-b-c-d-e-123[abcde]") === {true, 123}
  end

  test "recognises a real room with repetitions" do
    assert Four.is_room_real?("bbb-a-d-c-f-333[bacdf]") === {true, 333}
  end

  test "recognises a decoy one-lettered room" do
    assert Four.is_room_real?("a-b-x-d-e-123[abcde]") === {false, 123}
  end

  test "shifts letters of the alphabeth (non wrapping case)" do
    assert Four.shift_letters("aa", 1) === "bb"
  end

  test "shifts letters of the alphabeth (wrapping case)" do
    assert Four.shift_letters("az", 1) === "ba"
  end

end
