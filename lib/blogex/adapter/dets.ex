defmodule Adapter.Dets do
  @behaviour Blogex.Adapter

  @impl Blogex.Adapter
  def bootstrap(_opts \\ []) do
    {:ok, :disk_storage} = :dets.open_file(:disk_storage, [type: :set])
  end

  def insert_post(%Blogex.Post{} = post) do
    key = [post.blog_name, post.ts, post.uuid]
    value = post
    :dets.insert(:disk_storage, {key, value})
  end

  @impl Blogex.Adapter
  def get_post(id) do
    case :dets.select(:disk_storage, [{{[:_, :_, id], :_}, [], [:"$_"]}]) |> Enum.map(fn {_, v} -> v end)
    |> Enum.sort(&(&1.ts > &2.ts)) do 
      [] -> nil
      [x | _] -> x
    end 
  end

  @impl Blogex.Adapter
  def list_posts(blog_name) do
    :dets.select(:disk_storage, [{{[blog_name, :_, :_], :_}, [], [:"$_"]}]) |> Enum.map(fn {_, v} -> v end)
    |> Enum.sort(&(&1.ts > &2.ts))
  end
end
