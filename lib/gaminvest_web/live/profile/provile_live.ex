defmodule GaminvestWeb.ProfileLive do
  use GaminvestWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Perfil</h1>

    <%= live_component @socket, GaminvestWeb.NavComponent %>
    """
  end
end
