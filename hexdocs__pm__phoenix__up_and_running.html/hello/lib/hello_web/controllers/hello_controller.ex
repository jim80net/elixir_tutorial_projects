defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  # This is defined in router.ex
  # plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: String.capitalize(messenger))
  end
end