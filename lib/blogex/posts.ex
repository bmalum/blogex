defmodule Blogex.Post do
  use Ecto.Schema

  embedded_schema do
    field(:blog_name, :string)
    field(:uuid, Ecto.UUID)
    field(:title, :string)
    field(:content, :string)
    field(:author, :string)
    field(:tags, {:array, :string})
    field(:category, :string)
    field(:ts, :integer)
  end

  # def changeset() do

  # end

  def create_post(%Blogex.Post{} = post) do
    Blogex.Adapter.adapter().insert_post(post)
  end

  def get_post(id) do
    Blogex.Adapter.adapter().get_post(id)
  end

  def list_posts(blog_name) do
    Blogex.Adapter.adapter().list_posts(blog_name)
  end
end
