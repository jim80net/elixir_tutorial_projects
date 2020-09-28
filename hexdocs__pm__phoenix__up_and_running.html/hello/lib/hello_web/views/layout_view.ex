defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  def title, do: "Hello - Phoenix Frametwerk"

  def login_line(conn, assigns) do
    if Map.has_key?(assigns, :current_user) do
      # form_for conn, Routes.session_path(conn, :delete), [method: :delete, as: :user], fn _ ->
      #  submit "Log Out, #{assigns.current_user.username}"
      # end
      link("Log Out, #{assigns.current_user.username}",
        to: Routes.session_path(conn, :delete),
        method: :delete
      )
    else
      [
        link("Log In", to: Routes.session_path(conn, :new)),
        link("Create Account", to: Routes.user_path(conn, :new))
      ]
    end
  end
end
