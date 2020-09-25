require Jim

Jim.i Enum.map([1,2,3], &(&1 * 2))
Jim.i Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)

Jim.i Enum.map(1..13, &(&1 * 2))
Jim.i Enum.reduce(1..3, 0, &+/2)

IO.inspect List.insert_at([1,2,3], 1, :a)

odd? = &(rem(&1, 2) != 0)

Jim.i Enum.filter(1..3, odd?)

Jim.i 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum
Jim.i Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 *3)), odd?))

IO.inspect 1..100_000 |> Stream.map(&(&1 *3)) |> Stream.filter(odd?) 
IO.inspect 1..100_000 |> Stream.map(&(&1 *3)) |> Stream.filter(odd?)  |> Enum.take(3)

stream = Stream.cycle([1,2,3])
Jim.i Enum.take(stream, 10)

stream = Stream.unfold("hełło", &String.next_codepoint/1)

Jim.i Enum.take(stream, 6)

Jim.i Stream.unfold(<<1,2,3>>, fn 
  <<first, rest::binary>> -> {first, rest}
  <<>> -> nil 
end) |> Enum.to_list()

fib = Stream.unfold({1, 1}, fn {a, b} -> {a, {b, a + b}} end)

Jim.i fib |> Enum.take(10)
Jim.i fib |> Enum.at(100)
Jim.i fib |> Stream.map(& &1 * 2) |> Enum.take(10)


fizz_buzz =
  Stream.unfold(1, fn n ->
    elem =
      case n do
        n when rem(n, 15) == 0 -> "FizzBuzz"
        n when rem(n, 3) == 0 -> "Fizz"
        n when rem(n, 5) == 0 -> "Buzz"
        n -> Integer.to_string(n)
      end
    {elem, n+1}
  end)

Jim.i fizz_buzz |> Enum.take(20)

stream = File.stream!("enumerables.exs")
Jim.i stream
Jim.i Enum.take(stream, 10)
