defmodule GaminvestWeb.ProfileLive do
  use GaminvestWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Perfil")}
  end

  def render(assigns) do
    ~L"""
    """
  end
end
