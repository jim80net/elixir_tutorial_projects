require Jim

defmodule Math do 
  @vsn 2
  @moduledoc """
  Provides math related functions.

  ## Examples
    iex> Math.sum(1, 2)
    3
  """

  @doc """
  Calculates the sum of two numbers
  """
  def sum(a, b), do: a + b
end

defmodule MyServer do
  @initial_state %{host: "127.0.0.1", port: 3456}
  Jim.i @initial_state
  @my_data 14
  def first_data, do: @my_data
end

Jim.i MyServer.first_data

defmodule Foo do
  Module.register_awttribute __MODULE__, :param, acumulate: true

  @param :foo
  @param :bar
end

Jim.i Foo.
