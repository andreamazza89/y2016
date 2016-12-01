defmodule OneTest do
  use ExUnit.Case

  test "calculates final coordinates with simple right movement" do
    assert One.process_coordinates(['R1']) === {1,0}
  end

  test "calculates final coordinates with simple left movement" do
    assert One.process_coordinates(['L1']) === {-1,0}
  end
end
