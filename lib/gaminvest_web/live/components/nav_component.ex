defmodule GaminvestWeb.NavComponent do
  use GaminvestWeb, :live_component

  def render(assigns) do
    ~L"""
    <nav class="navbar">
      <ul>
          <li>
            <%= live_redirect "Home", to: Routes.live_path(@socket, GaminvestWeb.HomeLive) %>
          </li>
          <li>
            <%= live_redirect "Desafios", to: Routes.live_path(@socket, GaminvestWeb.ChallengeLive) %>
          </li>
          <li>
            <%= live_redirect "Módulos", to: Routes.live_path(@socket, GaminvestWeb.ModuleLive) %>
          </li>
          <li>
            <%= live_redirect "Poupança", to: Routes.live_path(@socket, GaminvestWeb.SavingsLive) %>
          </li>
      </ul>
    </nav>
    """
  end
end
