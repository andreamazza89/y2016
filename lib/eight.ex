defmodule Eight do
  
  def rectangle(screen, [turn_on: on_coordinates, pixels_per_line: screen_width]) do
    turn_pixel_on_if_in_range = fn({pixel_status, pixel_index}) -> 
      if within_rectangle?(pixel_index, screen_width, on_coordinates) do
        true
      else
        pixel_status
      end
    end

    screen |> Enum.with_index() |> Enum.map(turn_pixel_on_if_in_range)
  end

  defp within_rectangle?(pixel_index, screen_width, {on_width, on_height}) do
    column = rem(pixel_index, screen_width)
    row = div(pixel_index, screen_width)
    column < on_width and row < on_height
  end

  def rotate_column(screen, [column: shift_column, shift: shift], pixels_per_line: screen_width) do
    Enum.with_index(screen) |> Enum.map(fn({pixel_status, pixel_index}) -> 
      column = rem(pixel_index, screen_width)
      if column === shift_column do
        linear_shift = pixel_index - (screen_width * shift)
        Enum.at(screen, linear_shift) 
      else
        pixel_status
      end
    end)
  end

  def rotate_row(screen, [row: shift_row, shift: shift], pixels_per_line: screen_width) do
    Enum.with_index(screen) |> Enum.map(fn({pixel_status, pixel_index}) -> 
      row = div(pixel_index, screen_width)
      column = rem(pixel_index, screen_width)
      if row === (shift_row) do
        horizontal_shift = column - shift
        if horizontal_shift >= 0 do
          Enum.at(screen, pixel_index - shift) 
        else
          Enum.at(screen, pixel_index + screen_width - shift) 
        end
      else
        pixel_status
      end
    end)
  end

  def solve_day_eight_part_one(input) do
    screen = Enum.map((0..299), fn(_) -> false end) 
    updated_screen = Enum.reduce(input, screen, &screen_reducer/2)
  end
  
  defp screen_reducer(instruction, screen) do
    cond do
      Regex.match?(~r{rect}, instruction) ->
        captures = Regex.named_captures(~r{(?<width>\d+)x(?<height>\d+)}, instruction)
        on_width = String.to_integer(captures["width"])
        on_height = String.to_integer(captures["height"])
        rectangle(screen, [turn_on: {on_width, on_height}, pixels_per_line: 50]) 
      Regex.match?(~r{row}, instruction) ->
        captures = Regex.named_captures(~r{y\=(?<row>\d+) by (?<shift>\d+)}, instruction)
        row = String.to_integer(captures["row"])
        shift = String.to_integer(captures["shift"])
        rotate_row(screen, [row: row, shift: shift], pixels_per_line: 50)
      Regex.match?(~r{column}, instruction) ->
        captures = Regex.named_captures(~r{x\=(?<column>\d+) by (?<shift>\d+)}, instruction)
        column = String.to_integer(captures["column"])
        shift = String.to_integer(captures["shift"])
        rotate_column(screen, [column: column, shift: shift], pixels_per_line: 50)
    end
  end

  def pretty_print_screen(screen, screen_width) do
    lines = Enum.chunk(screen, screen_width)
    Enum.each(lines, fn(line) -> IO.puts inspect(line) end)
  end

end
