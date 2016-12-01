defmodule One do

  def process_coordinates([[rotation, steps]]) when rotation == 82 do
    {1, 0}
  end

  def process_coordinates([[rotation, steps]]) when rotation == 76 do
    {-1, 0}
  end

end
