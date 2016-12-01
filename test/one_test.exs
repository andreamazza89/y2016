defmodule OneTest do
  use ExUnit.Case

  test "calculates final coordinates with simple right movement" do
    assert One.process_coordinates(['R1']) === {1,0}
  end

  test "calculates final coordinates with simple left movement" do
    assert One.process_coordinates(['L1']) === {-1,0}
  end

  test "calculates final coordinates with more than one step" do
    assert One.process_coordinates(['L2']) === {-2,0}
  end

  test "calculates final coordinates with multi-digit steps" do
    assert One.process_coordinates(['L22']) === {-22,0}
  end

  test "does not move if instructions go back to the start" do
    assert One.process_coordinates(['R3', 'L3', 'L3', 'L3']) === {0,0}
  end

  test "calculates final coordinates appropriately (ex 1)" do
    assert One.process_coordinates(['R3', 'R3']) === {3,-3}
  end
end
