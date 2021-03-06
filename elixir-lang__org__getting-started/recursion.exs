require Jim

defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
    IO.puts msg
    print_multiple_times(msg, n - 1)
  end
end

Recursion.print_multiple_times("Hello!", 3)

defmodule Math do
  def sum_list([head |tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def sum_list(array) do
    sum_list(array, 0)
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail) ]
  end

  def double_each([]), do: []
end

Jim.p Math.sum_list([1,2,3], 0)
Jim.p Math.sum_list([1,2,3])
Jim.p Math.double_each([1,2,3])

Jim.p Enum.reduce([1,2,3], 0, fn(x, acc) -> x + acc end)
Jim.p Enum.reduce(Enum.map([1,2,3], fn(x) -> x * 2 end), 0, fn(x, acc) -> x + acc end)

Jim.p Enum.reduce([1,2,3], 0, &+/2)
Jim.p Enum.map([1,2,3],(&(&1 * 2)))
