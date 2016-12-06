defmodule Six do

  def frequencies(elements) do
    elements 
      |> Enum.group_by(&(&1)) 
      |> Enum.map(fn({k, v}) -> {k, length(v)} end)
  end

  def most_frequent_element(elements) do
    frequencies(elements) 
      |> Enum.max_by(fn({_character, frequency}) -> frequency end) 
      |> elem(0)
  end

  def make_list_of_nth_characters(noisy_messages, character_index) do
    Enum.map(noisy_messages, fn(message) -> String.at(message, character_index) end)
  end

  def solve_day_6_part_one(noisy_messages) do
    message_length = String.length(Enum.at(noisy_messages, 0))
    Enum.map((0..(message_length - 1)), fn(x) -> make_list_of_nth_characters(noisy_messages, x) end)
      |> Enum.map(&Six.most_frequent_element/1)
      |> List.to_string
  end

end
