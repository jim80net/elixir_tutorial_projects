require Jim

Jim.i alias Jim, as: J

J.i 123

import Jim

i :asdf

defmodule Stats do
  alias Math.List, as: List
end

defmodule Math do
  def plus(a, b) do
    alias Math.List
  end

  def minus(a, b) do
  end
end

require Integer
i Integer.is_odd(3)

import List, only: [duplicate: 2]

i duplicate :ok, 3

i ExUnit.start()
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "always pass" do
    assert true
  end
end

#defmodule Example do
#  use Feature, option: :value
#end
# is compiled into
#defmodule Example do
#  require Feature
#  Feature.__using__(option: :value)
#end

i is_atom(String)
i to_string(String)

i :"Elixir.String" == String
i :"Elixir.String" === String

i :lists.flatten([1, [2], 3])

i alias String, as: Str

i to_string(Str)

# defmodule Foo do
#   defmodule Bar do
#   end
# end
# is compiled into
# defmodule Elixir.Foo do
#   defmodule Elixir.Foo.Bar do
#   end
#   alias Elixir.Foo.Bar, as: Bar
# end
