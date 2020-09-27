defmodule HelloWeb.PageController do
  use HelloWeb, :controller


  def index(conn, %{"_format" => "json"}) do
    pages = [%{title: "foo"}, %{title: "bar"}]
    render(conn, :index, pages: pages)
  end

  def index(conn, %{"just_status" => "true"}) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
  def index(conn, %{"redirect" => "true"}) do
    redirect(conn, to: Routes.page_path(conn, :redirect_test))
  end
  def index(conn, %{"redirect" => "external"}) do
    redirect(conn, external: "https://hexdocs.pm/phoenix/controllers.html#content")
  end
  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]
    render(conn, :index, pages: pages)
  end

  def index_admin(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end

  def redirect_test(conn, _params) do
    render(conn, :index)
  end

  def show(conn, _params) do
    page = %{title: "foo"}
    render(conn, "show.json", page: page)
  end
end
