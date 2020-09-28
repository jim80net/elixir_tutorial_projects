defmodule Mix.Tasks.Hello.Greeting do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
  This is where we would put longform documentation or doc tests
  """

  def run(args) do
    Mix.Task.run("app.start")
    Mix.shell().info("Greetings from the Hello Phoenix Application #{IO.inspect(args)}")
  end
end
