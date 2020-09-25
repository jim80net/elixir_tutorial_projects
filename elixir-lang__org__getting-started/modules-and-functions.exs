defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end

  def zero?(0) do true end

  def zero?(x) when is_integer(x) do false end
end

defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts Math.sum(1,2)
# IO.puts(Math.do_sum(1,2))
IO.puts Math.zero?(0)
IO.puts Math.zero?(23)


IO.puts Concat.join("Hello", "world")
IO.puts Concat.join("Hello", "world", "_")

defmodule DefaultTest do
  def dowork(x \\ "hello") do
    x
  end
end

defmodule Concat do
  # A function head declaring defaults
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

