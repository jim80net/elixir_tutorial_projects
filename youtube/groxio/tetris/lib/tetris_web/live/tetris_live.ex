defmodule TetrisWeb.TetrisLive do
  use TetrisWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok, 
      assign(
        socket, 
        brick: Tetris.Brick.new_random() |> Tetris.Brick.to_string()
      )
    }
  end

  def render(assigns) do
   ~L"""
     <pre><%=@brick%></pre>
    """
  end

  def svg_head() do
    """
    <svg version="1.0"
    id="Layer_1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    width="200"
    height="400"
    viewbox="0 0 200 400"
    xml:space="preserve">
    """
  end

  def svg_foot() do
  """
  </svg>
  """
  end

  def square({x,y}) do
    to_points()
    <rect 
      x = "1"
      y = "1"
      style = "fill:#AAA;"
      width = "18"
      height = "18"
    />
  end
end
