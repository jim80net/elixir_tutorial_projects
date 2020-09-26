defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def index_admin(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end
end
