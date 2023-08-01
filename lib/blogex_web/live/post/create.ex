defmodule BlogexWeb.Post.CreateLive do
  use BlogexWeb, :live_view

  def mount(params, session, socket) do
    {:ok, socket |> assign(output: "") |> assign(uuid: Ecto.UUID.generate)}
  end

  def handle_event("markdown", %{"textarea" => textarea}, socket) do
    {:noreply, socket |> assign(output: Earmark.as_html!(textarea))}
  end
  def render(assigns) do
    ~H"""
    <div>
    <%= @uuid %>
    <form phx-change="markdown">
    <textarea name="textarea" />
    </form>
    <%= raw(@output) %>
    </div>
    """
  end
end
