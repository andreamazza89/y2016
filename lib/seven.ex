defmodule Seven do

  @abba ~r|(\w)(\w)\2\1|
  @aba ~r|(\w)\w\1|
  @hypernet_sequence ~r{\[\w+\]}
  @any_square_bracket ~r{\[|\]}

  def supportsSSL?(address) do
    content_in_brackets = get_content_in_square_brackets(address)
    content_outside_brackets = get_content_outside_square_brackets(address)

 
    aba = content_outside_brackets  |> IO.inspect|> Enum.map(fn(potential_aba) -> Regex.run(@aba, potential_aba) end) |> List.flatten |> Enum.reject(&(&1 === nil)) |> Enum.filter(&(String.length(&1) === 3)) 

    if aba !== [] do
      Enum.any?(aba, fn(potential_bab_match) ->
        [a,b,_] = String.to_charlist(potential_bab_match)
        bab = List.to_string([b,a,b])
        Enum.any?(content_in_brackets, fn(potential_bab) -> String.contains?(potential_bab, bab) end) 
      end)
    else
      false
    end
  end

  def supportsTLS?(address) do
    content_in_brackets = get_content_in_square_brackets(address)
    content_outside_brackets = get_content_outside_square_brackets(address)

    Enum.any?(content_outside_brackets, fn(chunk) -> has_abba?(chunk) end) and 
    Enum.all?(content_in_brackets, fn(chunk) -> (not has_abba?(chunk)) end)
  end
  
  def has_abba?(ip_chunk) do
    string_is_not_all_one_character? = fn(potential_abba) -> 
        length(potential_abba |> String.to_charlist |> Enum.uniq) > 1 
      end

    Regex.scan(@abba, ip_chunk) 
      |> List.flatten 
      |> Enum.filter(&(String.length(&1) === 4))
      |> Enum.any?(string_is_not_all_one_character?)
  end

  def get_content_in_square_brackets(address) do
    Regex.scan(@hypernet_sequence, address) 
      |> List.flatten 
      |> Enum.map(&remove_brackets/1)
  end

  def get_content_outside_square_brackets(address) do
    content_in_brackets = get_content_in_square_brackets(address)
    Enum.reduce(content_in_brackets, address, fn(brackets, address) -> 
        String.replace(address, brackets, "") 
      end) |> String.split("[]")
  end

  defp remove_brackets(string) do
    String.replace(string, @any_square_bracket, "")
  end

  def solve_day_seven_part_one(input) do
    addresses = input |> String.trim |> String.split("\n")
    Enum.count(addresses, fn(address) -> supportsTLS?(address) end)
  end

  def solve_day_seven_part_two(input) do
    addresses = input |> String.trim |> String.split("\n")
    Enum.count(addresses, fn(address) -> supportsSSL?(address) end)
  end

end
