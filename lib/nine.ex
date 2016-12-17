defmodule Nine do
  @regex_chars_to_repeat ~r{(?<=\()\d+(?=x\d+\))}

  def calculate_decompressed_lenght(decompressed_sequence) do
    String.length(decompressed_sequence)
  end

  def decompress_message(compressed_sequence) do
    do_decompress_message(compressed_sequence)
  end

  def do_decompress_message(compressed_sequence) do
    if replace_again?(compressed_sequence) do
      chars_to_repeat = Regex.run(@regex_chars_to_repeat, compressed_sequence)
      regex_for_this_marker = make_regex(chars_to_repeat) 
      partially_decompressed = 
        Regex.replace(regex_for_this_marker, compressed_sequence, &repeat_matched_characters/4, global: false)
      do_decompress_message(partially_decompressed)
    else
      compressed_sequence
    end
  end

  defp replace_again?(compressed_sequence) do
    Regex.match?(~r{[\(\)]}, compressed_sequence) 
  end

  def repeat_matched_characters(_whole_match, _character_length, repeat, character) do
    repeats = String.to_integer(repeat)
    String.duplicate(character, repeats) |> String.replace(~r{[\(\)]}, "_")
  end

  def make_regex(repeat) do
    ~r|\((\d+)x(\d+)\)(.{#{repeat}})|
  end

end

