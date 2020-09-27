defmodule HelloWeb.PageView do
  use HelloWeb, :view

  def render("myindex.html", assigns) do
    require Logger
    Logger.info inspect(assigns, pretty: true)
  end
end
