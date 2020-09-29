defmodule HelloWeb.ErrorViewTest do
  use HelloWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  @moduletag :error_view_case

  @tag individual_test: "404"
  test "renders 404.html" do
    assert render_to_string(HelloWeb.ErrorView, "404.html", []) == "Not Found"
  end

  @tag individual_test: "500"
  test "renders 500.html" do
    assert render_to_string(HelloWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
