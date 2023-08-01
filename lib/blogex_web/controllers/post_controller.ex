defmodule BlogexWeb.PostController do
  use BlogexWeb, :controller

  def show(conn, %{"id" => id}) do
    post = Blogex.Post.get_post(id)
    render(conn, :post, post: post)
  end
end
