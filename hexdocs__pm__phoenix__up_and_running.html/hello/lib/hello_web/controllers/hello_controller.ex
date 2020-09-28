defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  # This is defined in router.ex
  # plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def index_admin(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: String.capitalize(messenger))
  end

  def show_admin(conn, %{"messenger" => messenger}) do
    conn
    |> put_layout("admin.html")
    |> render("show.html", messenger: String.capitalize(messenger))
  end

  def show_api(conn, %{"messenger" => messenger}) do
    json(conn, %{msg: "Hello, #{messenger}"})
  end
end
