defmodule ThreeTest do
  use ExUnit.Case

  describe "checking the validity of one triangle" do
    test "good triangle example one" do
      assert Three.is_triangle?([10, 10, 10]) === true
    end
    
    test "bad triangle example one" do
      assert Three.is_triangle?([1, 10, 12]) === false
    end
  end

  describe "counting a list of maybe triangles" do
    test "counts how many valid triangles there are" do
      assert Three.count_valid_triangles([[2,2,3], [1,1,2], [1,1,1]]) === 2
    end
  end

end
