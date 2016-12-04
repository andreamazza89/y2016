defmodule Four do

  def is_room_real?(room_data) do
    captures = Regex.named_captures(~r|(?<room_name>.+-)(?<id>\d+)(?<checksum>\[\w+\])|, room_data)
    checksum = String.replace(captures["checksum"], ~r{[\[\]]}, "") |> String.to_charlist
    room_name = String.replace(captures["room_name"], "-", "") |> String.to_charlist
    sorted_room_name = room_name |> Enum.group_by(&(&1)) 
                                 |> Enum.map(fn({k, v}) ->  {k, length(v)} end) 
                                 |> Enum.sort(fn({k1, v1}, {k2, v2}) -> k1 > k2 end) 
                                 |> Enum.sort(fn({k1,v1}, {k2,v2}) -> v1 > v2 end ) 
                                 |> Enum.map(fn({k, v}) -> k end)
    {checksum === Enum.take(sorted_room_name, 5), String.to_integer(captures["id"])}
  end

  def shift_letters(input, shift_amount) do
    normalised_shift_amount = rem(shift_amount, 26)
    apply_shift = fn(character) -> rem(character - 97 + normalised_shift_amount, 26) + 97 end
    input |> String.to_charlist |> Enum.map(apply_shift) |> List.to_string
  end

  def solve_day_four_part_one do
    room_codes = File.read!("inputs/four") |> String.trim() |> String.split("\n") 
    Enum.reduce(room_codes, 0, fn(code, accumulator) -> 

      case is_room_real?(code)  do 
        {true, id}  -> id + accumulator
        {false, _} -> accumulator
      end
    end)
  end

  def solve_day_four_part_two do
    room_codes = File.read!("inputs/four") |> String.trim()|> String.split("\n") 
    translated_rooms = room_codes |> Enum.filter(&is_room_real?/1) 
                                  |> Enum.map(fn(room_code) -> 
      captures = Regex.named_captures(~r|(?<room_name>.+-)(?<id>\d+)|, room_code)
      shift_letters(captures["room_name"], String.to_integer(captures["id"])) <> "\n"
    end)
    File.write!("delete", translated_rooms)
  end
end


IO.puts inspect Four.solve_day_four_part_one
IO.puts Four.solve_day_four_part_two
