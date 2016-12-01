defmodule One do

  @left 76
  @right 82

  def process_coordinates([[rotation | steps] | future_instructions]) when rotation === @right do
    process_coordinates(future_instructions, {List.to_integer(steps), 0}, :east) 
  end

  def process_coordinates([[rotation | steps] | future_instructions]) when rotation === @left do
    process_coordinates(future_instructions, {-List.to_integer(steps), 0}, :west) 
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, direction) when rotation === @left do
    case direction do 
      :east -> process_coordinates(future_instructions, {current_x, current_y + List.to_integer(steps)}, :north)
      :north -> process_coordinates(future_instructions, {current_x - List.to_integer(steps), current_y}, :west)
      :west -> process_coordinates(future_instructions, {current_x, current_y - List.to_integer(steps)}, :south)
      :south -> process_coordinates(future_instructions, {current_x + List.to_integer(steps), current_y}, :east)
    end
  end

  def process_coordinates([[rotation | steps] | future_instructions] , {current_x, current_y}, direction) when rotation === @right do
    case  direction do
      :east -> process_coordinates(future_instructions, {current_x, current_y - List.to_integer(steps)}, :south)
      :north -> process_coordinates(future_instructions, {current_x + List.to_integer(steps), current_y}, :east)
      :west -> process_coordinates(future_instructions, {current_x, current_y + List.to_integer(steps)}, :north)
      :south -> process_coordinates(future_instructions, {current_x - List.to_integer(steps), current_y}, :west)
    end
  end

  def process_coordinates([], coordinates, _direction) do
    coordinates
  end

end
