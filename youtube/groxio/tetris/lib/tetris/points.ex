defmodule Tetris.Points do
  def translate(points, {dx, dy}) do
    Enum.map(points, fn {x, y} -> {dx + x, dy + y} end)
  end

  def transpose(points) do
    points
    |> Enum.map(fn {x, y} -> {y, x} end)
  end

  def mirror(points) do
    points
    |> Enum.map(fn {x, y} -> {5 - x, y} end)
  end

  def flip(points) do
    points
    |> Enum.map(fn {x, y} -> {x, 5 - y} end)
  end

  # x
  # x
  # x x
  #  -- -- --> transpose
  # x x x
  #     x
  # -- -- --> mirror
  # x x x
  # x   
  def rotate_90(points) do
    points
    |> transpose
    |> mirror
  end

  def rotate(points, 0), do: points
  def rotate(points, 90), do: rotate_90(points)

  def rotate(points, 180) do
    points
    |> rotate(90)
    |> rotate(90)
  end

  def rotate(points, 270) do
    points
    |> rotate(90)
    |> rotate(180)
  end
end
