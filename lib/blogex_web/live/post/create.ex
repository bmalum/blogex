defmodule BlogexWeb.Post.CreateLive do
  use BlogexWeb, :live_view

  def mount(_params, _session, socket) do
    socket = if connected?(socket), do: assign(socket, uuid: Ecto.UUID.generate), else: socket |> assign(:uuid,  "-")
    {:ok, socket |> assign(output: "") |> assign(:form, Blogex.Post.change_post(%Blogex.Post{}, %{uuid: socket.assigns.uuid}))}
  end

  def handle_event("markdown", %{"textarea" => textarea}, socket) do
    {:noreply, socket |> assign(output: Earmark.as_html!(textarea))}
  end

  def render(assigns) do
    ~H"""
    <div class="w-full grid grid-cols-2 gap-5">
    <div class="">
    <span class="w-full block text-2xl"> Article Edit:</span>
    <.form for={@form} :let={f} phx-change="markdown" phx-submit="save">
        <.input field={f[:uuid]} label="UUID" disabled: true />
        <.input field={f[:headline]} label="Headline"/>
        <textarea name="textarea" />
    </.form>
    </div>
    <div class="">
    <span class="w-full block text-2xl"> Preview:</span>
    <div class="prose">
    <%= raw(@output) %>
    </div>
    </div>
    </div>
    """
  end
end
