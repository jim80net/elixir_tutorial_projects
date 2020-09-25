defmodule Jim do
  def p(string, expression) do
    IO.puts("#{string} = #{expression}")
  end

  defmacro p(clause) do
    string = Macro.to_string(clause)
    quote do
     Jim.p(unquote(string), unquote(clause))
    end
  end

  defmacro i(clause) do
    string = Macro.to_string(clause)
    quote do
      IO.inspect(unquote(clause), label: unquote(string))
    end
  end
end
