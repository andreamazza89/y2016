defmodule One do

  def process_coordinates([[rotation | steps]]) when rotation === 82 do
    {List.to_integer(steps), 0}
  end

  def process_coordinates([[rotation | steps]]) when rotation === 76 do
    {-List.to_integer(steps), 0}
  end

  def process_coordinates([[rotation | steps] | future_instructions]) when rotation === 82 do
    process_coordinates(future_instructions, {List.to_integer(steps), 0}, :east) 
  end

  def process_coordinates([[rotation | steps] | future_instructions]) when rotation === 76 do
    process_coordinates(future_instructions, {-List.to_integer(steps), 0}, :west) 
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :east) when rotation === 76 do
    process_coordinates(future_instructions, {current_x, current_y + List.to_integer(steps)}, :north)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :north) when rotation === 76 do
    process_coordinates(future_instructions, {current_x - List.to_integer(steps), current_y}, :west)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :west) when rotation === 76 do
    process_coordinates(future_instructions, {current_x, current_y - List.to_integer(steps)}, :south)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :south) when rotation === 76 do
    process_coordinates(future_instructions, {current_x + List.to_integer(steps), current_y}, :east)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :east) when rotation === 82 do
    process_coordinates(future_instructions, {current_x, current_y - List.to_integer(steps)}, :south)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :north) when rotation === 82 do
    process_coordinates(future_instructions, {current_x + List.to_integer(steps), current_y}, :east)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :west) when rotation === 82 do
    process_coordinates(future_instructions, {current_x, current_y + List.to_integer(steps)}, :north)
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, :south) when rotation === 82 do
    process_coordinates(future_instructions, {current_x - List.to_integer(steps), current_y}, :west)
  end

  def process_coordinates([], coordinates, _direction) do
    coordinates
  end

end
