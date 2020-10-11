defmodule BrickTest do
  use ExUnit.Case
  import Tetris.Brick

  test "Creates a new brick" do
    assert new().name == :i
  end

  test "Creates a new random brick" do
    actual = new_random()

    assert actual.name in ~w( i l z t o)a
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end
end
