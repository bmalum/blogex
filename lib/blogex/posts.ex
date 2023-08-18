defmodule Blogex.Post do
  use Ecto.Schema
  import Ecto.Changeset

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

  def changeset(data, params) do
    data
    |> cast(params, [:author, :blog_name, :category, :content, :tags, :title, :ts, :uuid])
    |> validate_required([:author, :blog_name, :content, :title, :ts, :uuid])
  end
  
  def change_post(%Blogex.Post{} = post, params) do
    Blogex.Post.changeset(post, params)
  end

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