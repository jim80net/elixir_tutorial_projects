defmodule HelloTestWeb.PageController do
  use HelloTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
