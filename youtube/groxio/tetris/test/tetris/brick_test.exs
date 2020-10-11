defmodule BrickTest do
  use ExUnit.Case
  import Tetris.Brick

  test "Creates a new brick" do
    assert new().name == :i
  end
end
