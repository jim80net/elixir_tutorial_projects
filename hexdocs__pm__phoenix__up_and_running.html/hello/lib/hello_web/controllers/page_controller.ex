defmodule HelloWeb.PageController do
  use HelloWeb, :controller


  def index(conn, %{"_format" => "json"}) do
    json(conn, %{index: "asdf"})
  end

  def index(conn, %{"just_status" => "true"}) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
  def index(conn, _params) do
    render(conn, :index)
  end

  def index_admin(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end
end
