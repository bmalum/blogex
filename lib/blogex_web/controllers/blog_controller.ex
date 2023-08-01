defmodule BlogexWeb.BlogController do
  use BlogexWeb, :controller

  def blog(conn, _params) do
    posts = Blogex.Post.list_posts("bmalum")
    render(conn, :blog, posts: posts, headline: Application.get_env(:blogex, :headline) || "Posts")
  end
end
