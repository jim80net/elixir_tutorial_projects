defmodule HelloTest.Blog.PostTest do
  use HelloTest.DataCase, async: true
  alias HelloTest.Blog.Post

  test "title must be at least two characters long" do
    changeset = Post.changeset(%Post{}, %{title: "I"})
    assert %{title: ["should be at least 2 character(s)"]} = errors_on(changeset)
  end
end