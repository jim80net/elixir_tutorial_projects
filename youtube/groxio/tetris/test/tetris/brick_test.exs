defmodule BrickTest do
  use ExUnit.Case
  import Tetris.Brick
  alias Tetris.Points

  test "Creates a new brick" do
    assert new().name == :i
  end

  test "Creates a new random brick" do
    actual = new_random()

    assert actual.name in ~w( i l z t o )a
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "should manipulate brick" do
    actual =
      new()
      |> left
      |> right
      |> right
      |> down
      |> spin_90
      |> spin_90

    assert actual.location == {41, 1}
    assert actual.rotation == 180
  end

  test "should return points" do
    points =
      new_brick(name: :i)
      |> points

    assert {2, 2} in points
  end

  test "should translate a list of points" do
    actual = new() |> points() |> Points.translate({1, 1}) |> Points.translate({0, 1})

    assert [{3, 3}, {3, 4}, {3, 5}, {3, 6}] == actual
  end

  test "should mirror, flip, and rotate, rotate" do
    [{1, 1}]
    |> Points.mirror()
    |> assert_point([{4, 1}])
    |> Points.flip()
    |> assert_point([{4, 4}])
    |> Points.rotate(90)
    |> assert_point([{1, 4}])
    |> Points.rotate(90)
    |> assert_point([{1, 1}])
  end

  test "should convert brick to string" do
    actual = new() |> Tetris.Brick.to_string()
    expected = "⬛❎⬛⬛\n⬛❎⬛⬛\n⬛❎⬛⬛\n⬛❎⬛⬛"

    assert actual == expected
  end

  test "should inspect bricks" do
    actual = new_brick() |> inspect()

    expected = """
    ⬛❎⬛⬛
    ⬛❎⬛⬛
    ⬛❎⬛⬛
    ⬛❎⬛⬛
    """

    assert "#{actual}\n" == expected
  end

  def new_brick(attributes \\ []), do: new(attributes)

  def assert_point(actual, expected) do
    assert actual == expected
    actual
  end
end
