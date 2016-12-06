defmodule Five do
  
  def five_zeroes?(sequence) do 
    first_five = Enum.take(sequence, 5)
    if first_five === '00000' do
      {true, [Enum.at(sequence, 5)], [Enum.at(sequence, 6)]}
    else
      false
    end
  end

  def solve_day_five_part_one(door_id) do
    do_solve_day_five_part_one(door_id, '0', '')
  end

  def do_solve_day_five_part_one(_, _, pin) when length(pin) == 8 do
    pin |> List.to_string
  end

  def do_solve_day_five_part_one(door_id, suffix, pin)do
    next_suffix = (List.to_integer(suffix) + 1) |> Integer.to_charlist
    current_hash = :crypto.hash(:md5, door_id ++ suffix) |> Base.encode16 |> String.to_charlist
    case five_zeroes?(current_hash) do
      {true, digit} -> do_solve_day_five_part_one(door_id, next_suffix, pin ++ digit)
      false -> do_solve_day_five_part_one(door_id, next_suffix, pin)
    end 
  end

  def solve_day_five_part_two(door_id) do
    do_solve_day_five_part_two(door_id, '0', [])
  end

  def do_solve_day_five_part_two(_, _, pin) when length(pin) == 8 do
    pin
  end

  def do_solve_day_five_part_two(door_id, suffix, pin) do
    next_suffix = (List.to_integer(suffix) + 1) |> Integer.to_charlist
    current_hash = :crypto.hash(:md5, door_id ++ suffix) |> Base.encode16 |> String.to_charlist
    case five_zeroes?(current_hash) do
      {true, position, digit} when position < 8 -> do_solve_day_five_part_two(door_id, next_suffix, pin ++ [{position, digit}])
      {true, position, digit} when position >= 8 -> do_solve_day_five_part_two(door_id, next_suffix, pin)
      false -> do_solve_day_five_part_two(door_id, next_suffix, pin)
    end 
  end
end
