defmodule HelloWeb.CMS.PageView do
  use HelloWeb, :view

  alias Hello.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end

  def can_edit(conn) do
    # IO.inspect assigns.current_author.id
    # IO.inspect assigns.page.author.id
    # ssigns.current_author.id == assigns.page.author.id
    HelloWeb.CMS.PageController.can_edit(conn, nil)
  end

  def debug,
    do:
      (
        require IEx
        IEx.pry()
      )
end
