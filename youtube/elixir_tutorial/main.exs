defmodule M do

  def data_stuff do
    # my_float = 3.14159
    # IO.puts "Float: #{is_float(my_float)}"
    IO.puts "Atom: #{is_atom(:Pittsburgh)}"
    # one_to_10 = 1..10
  end

  def string_stuff do
    my_str = "My Sentence"
    IO.puts "Length: #{String.length(my_str)}"

    longer_str = my_str <> " is longer"
    IO.puts "Equal: #{"Egg" === "egg"}"
    IO.puts "My ?: #{String.contains?(my_str, "My")}"
    IO.puts "First: #{String.first(my_str)}"
    IO.puts "Index 4: #{String.at(my_str, 4)}"
    IO.puts "Substring: #{String.slice(my_str, 3, 8)}"

    IO.inspect String.split(longer_str, " ")
    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(longer_str)
    IO.puts String.downcase(longer_str)
    IO.puts String.capitalize(longer_str)

    4 * 10 |> IO.puts
  end

  def puts(string, expression) do
    IO.puts("#{string} = " <> "#{expression}")
  end

  defmacro puts(clause) do
    string = Macro.to_string(clause)
    quote do
      puts(unquote(string), unquote(clause))
    end
  end

  def math_stuff do
    puts "5 + 4 = ", 5+4
    puts "5 - 4 = ", 5 - 4
    puts 5 * 4
    puts 5 / 4
    puts div(5,4)
    puts rem(5,4)
  end

  def compare_stuff do
    puts 5 == 5.0
    puts 5 === 5.0
    puts 5 != 5.0
    puts 5 !== 5.0
    puts 6 > 5
    puts 6 >= 5
    puts 6 < 5
    puts 6 <= 5
  end

  def logical_stuff do
    age = 16
    puts age >= 16 and age >= 18
    puts age >= 16 or age >= 18
    puts not true
  end

  def decision_stuff do
    age = 16
    if  age >= 18 do
      IO.puts "Can vote"
    else
      IO.puts "Can't vote"
    end

    unless age === 18 do
      IO.puts "you are not 18"
    else
      IO.puts "you are 18"
    end

    cond do
      age >= 18 -> IO.puts "You can vote"
      age >= 16 -> IO.puts "You can drive"
      age >= 14 -> IO.puts "You can wait"
      true -> "You can default"
    end

    case 2 do
      1 -> 1
      2 -> 2
      _ -> true
    end

    puts if age > 18, do: "Can Vote", else: "Can't Vote"

  end

  def tuple_stuff do
    my_stats = {174, 6.25, :Jim}
    puts is_tuple(my_stats)

    my_stats2 = Tuple.append(my_stats, 42)

    puts "Age #{elem(my_stats2, 3)}"
    puts "Size: #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)

    my_stats4 = Tuple.insert_at(my_stats3, 0, 1974)
    IO.inspect my_stats4

    many_zeros = Tuple.duplicate(0, 5)
    IO.inspect many_zeros

    {weight, height, name} = {175, 6.25, "Jim"}

    IO.inspect {weight, height, name}
  end

  def list_stuff do
    list1 = [1,2,3]
    list2 = [4,5,6]
    list3 = list1 ++ list2
    list4 = list3 -- list1

    puts list4 == list2

    puts 6 in list4

    [head|tail] = list3
    IO.inspect head
    IO.inspect tail

    IO.write "Tail : "
    IO.inspect tail

    IO.inspect [97,98], charlists: :as_lists

    Enum.each tail, fn item ->
      IO.puts item
    end

    words = ["Random", "words", "in a", "list"]

    Enum.each words, fn word ->
      IO.puts word
    end

    display_list(words)

    IO.puts display_list(List.delete(words, "Random"))
    IO.puts display_list(List.delete_at(words, 1))
    IO.puts display_list(List.insert_at(words, 4, ", Yeah!"))
    puts List.first(words)
    puts List.last(words)

    my_stats = [name: "Derek", height: 6.25]
    IO.inspect my_stats
  end

  def display_list([word|words]) do
    IO.puts word
    display_list(words)
  end

  def display_list([]), do: nil 

  
  def map_stuff do
    capitals = %{
      "Alabama" => "Montgomery",
      "Alaska" => "Juneau",
      "Arizona" => "Phoenix"
    }
    puts capitals["Alaska"]

    capitals2 = %{
      :alabama => "Montgomery",
      :alaska => "Juneau",
      :arizona => "Phoenix"
    }
    puts capitals2[:alaska]

    capitals3 = Map.put_new(capitals, "Arkansas", "Little Rock")
    IO.inspect capitals3
  end

  def pattern_matching_stuff do
    [length, width] = [20, 30]
    puts length
    puts width

    [_,[_, a]] = [20, [30,40]]
    puts a
  end

  def anonymous_function_stuff do
    get_sum = fn(x, y) -> x + y end
    puts get_sum.(5, 5)

    get_less = &(&1 - &2)

    puts get_less.(8,3)

    add_sum = fn
      {x} -> x
      {x, y} -> x + y
      {x, y, z} -> x + y + z
    end

    puts add_sum.({1,2})
    puts add_sum.({1,2,3})

    IO.puts do_it()
  end

  def do_it(x \\ 1, y \\ 1) do
    x + y
  end

  def recursive_stuff do
    puts factorial(4)

  end

  def factorial(num) when num == 1 do
    1
  end

  def factorial(num) do
    num * factorial(num - 1)
  end

  def looping_stuff do
    puts sum([1,2,3,4,5])
    loop(5,1)
  end

  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def loop(0, _, do: _), do: nil
  def loop(max, min, do: _) when max < min do
    loop(0, min, do: nil)
  end
  def loop(max, min, do: function) do
    IO.inspect [max, min]
    loop(max - 1, min, do: function)
  end
  def loop(max,min) do
    loop(max, min, do: nil)
  end

  def enumerable_stuff do
    puts Enum.all?([1,2,3], fn(n) -> rem(n, 2) == 0 end)
    puts Enum.any?([1,2,3], fn(n) -> rem(n, 2) == 0 end)
    Enum.each([1,2,3], fn(n) -> IO.puts n end)

    IO.inspect Enum.map([1,2,3], fn(n) -> n * 2 end)

    puts Enum.reduce([1,2,3], fn(n,c) -> n + c end)

    IO.inspect Enum.uniq([1,2,3,3])
  end

  def list_comprehensions_stuff do
    IO.inspect for n <- [1,2,3], do: n * 2

    even_list = for n <- [1,2,3,4], rem(n,2) == 0, do: n
    IO.inspect even_list
  end

  def exception_handling_stuff do
    err = try do
      5 / 0
    rescue
      ArithmeticError -> "Can't do it"
    end

    IO.puts err
  end

  def concurrency_stuff do
    spawn (fn() -> loop(5, 1, do: send(self(), {:french, "Bob"})) end)
    spawn (fn() -> loop(10, 5) end)

    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:french, name} -> IO.puts "Bonjour #{name}"
      {:english, name} -> IO.puts "Hello #{name}"
    after 
      500 -> IO.puts "Time up!"
    end
  end

  def main do
    # name = IO.gets("What is your name? ") |> String.trim
    # IO.puts "Hello, #{name}"

    M.concurrency_stuff
  end
end

