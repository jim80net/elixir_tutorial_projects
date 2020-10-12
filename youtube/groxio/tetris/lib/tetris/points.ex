defmodule Tetris.Points do
  def translate(points, {dx, dy}) do
    Enum.map(points, fn {x, y} -> {dx + x, dy + y} end)
  end
end
