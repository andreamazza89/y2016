defmodule Three do

  def is_triangle?([side_a, side_b, side_c]) do
    (side_a + side_b > side_c) and
    (side_a + side_c > side_b) and
    (side_b + side_c > side_a) 
  end

  def count_valid_triangles(triangles) do
    do_count_valid_triangles(triangles, 0) 
  end

  defp do_count_valid_triangles([first_triangle | other_triangles], accumulator) do
    if is_triangle?(first_triangle) do
      do_count_valid_triangles(other_triangles, accumulator + 1)
    else
      do_count_valid_triangles(other_triangles, accumulator)
    end
  end

  defp do_count_valid_triangles([], accumulator) do
    accumulator
  end

  def solve_day_three_part_one do
    {:ok, raw_triangles} = File.read("inputs/three") 
    triangles_list = raw_triangles 
     |> String.trim()
     |> String.split(~r[\s+])
     |> Enum.map(&String.to_integer/1)
     |> Enum.chunk(3)

    IO.puts count_valid_triangles(triangles_list)
  end

  def solve_day_three_part_two do
    {:ok, raw_triangles} = File.read("inputs/three") 
    triangles_list = raw_triangles 
     |> String.trim()
     |> String.split(~r[\s+])
     |> Enum.map(&String.to_integer/1)
     |> process_list_in_columns()

    IO.puts count_valid_triangles(triangles_list)
  end

  defp process_list_in_columns([a1,b1,c1,a2,b2,c2,a3,b3,c3 | tail]) do
    do_process_list_in_columns(tail, [[a1,a2,a3],[b1,b2,b3],[c1,c2,c3]])
  end

  defp do_process_list_in_columns([a1,b1,c1,a2,b2,c2,a3,b3,c3 | tail], triangles_accumulated) do
    do_process_list_in_columns(tail, triangles_accumulated ++ [[a1,a2,a3],[b1,b2,b3],[c1,c2,c3]])
  end

  defp do_process_list_in_columns([], all_triangles), do: all_triangles

end


Three.solve_day_three_part_one
Three.solve_day_three_part_two
