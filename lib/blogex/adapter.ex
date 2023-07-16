defmodule Blogex.Adapter do
  @callback bootstrap(opts :: [Keyword.t]) :: Tuple.t()
  @callback get_post(id :: String.t()) :: [ Blogex.Post.t() ] | {:error | any()}
  @callback list_posts(blog_name :: String.t()) :: [ Blogex.Post.t() ] | {:error | any()}

  def adapter() do
    Application.get_env(:blogex, Blogex.Adapter)[:adapter]
  end
end
