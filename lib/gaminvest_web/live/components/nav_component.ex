defmodule GaminvestWeb.NavComponent do
  use GaminvestWeb, :live_component

  def render(assigns) do
    ~L"""
    <nav class="navbar">
      <ul>

          <li>
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.ChallengeLive) do %>
              <i class="fa fa-trophy"></i>
            <%= end %>
          </li>
          <li>
            <%= live_redirect  to: Routes.live_path(@socket, GaminvestWeb.ModuleLive) do %>
              <i class="fas fa-book"></i>
            <% end %>
          </li>
          <li>
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.HomeLive) do %>
              <i class="fa fa-home"></i>
            <% end %>
          </li>
          <li>
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.SavingsLive) do %>
              <i class="fas fa-wallet"></i>
            <% end %>
          </li>
          <li>
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.ProfileLive) do %>
              <i class="fa fa-user"></i>
            <% end %>
          </li>
      </ul>
    </nav>
    """
  end
end
