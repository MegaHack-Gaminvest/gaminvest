defmodule GaminvestWeb.NavComponent do
  use GaminvestWeb, :live_component

  def render(assigns) do
    ~L"""
    <div class="<%= @classname %> navbar">
      <div class="navbar__content">

        <!-- Challenges -->
        <div class="navbar__item navbar-item <%= if @page_title == "Desafios", do: "navbar-item--selected" %>">
          <div class="navbar-item__icon">
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.ChallengeLive, classname: @classname) do %>
              <i class="fa fa-trophy fa-lg"></i>
            <%= end %>
          </div>
          <div class="navbar-item__name">
            Desafios
          </div>
        </div>

        <!-- Modules -->
          <div class="navbar__item navbar-item <%= if @page_title == "Módulos", do: "navbar-item--selected" %>">
            <div class="navbar-item__icon">
              <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.ModuleLive, classname: @classname) do %>
                <i class="fa fa-book fa-lg"></i>
              <%= end %>
            </div>
            <div class="navbar-item__name">
              Módulos
            </div>
          </div>
        
        <!-- Home -->
        <div class="navbar__item navbar-item <%= if @page_title == "Home", do: "navbar-item--selected" %>">
          <div class="navbar-item__icon">
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.HomeLive, classname: @classname) do %>
              <i class="fa fa-home fa-lg"></i>
            <%= end %>
          </div>
          <div class="navbar-item__name">
            Home
          </div>
        </div>

        <!-- Wallet -->
        <div class="navbar__item navbar-item <%= if @page_title == "Poupança", do: "navbar-item--selected" %>">
          <div class="navbar-item__icon">
            <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.SavingsLive, classname: @classname) do %>
              <i class="fa fa-wallet fa-lg"></i>
            <%= end %>
          </div>
          <div class="navbar-item__name">
            Poupança
          </div>
        </div>

        <!-- Profile -->
          <div class="navbar__item navbar-item <%= if @page_title == "Perfil", do: "navbar-item--selected" %>">
            <div class="navbar-item__icon">
              <%= live_redirect to: Routes.live_path(@socket, GaminvestWeb.ProfileLive, classname: @classname) do %>
                <i class="fa fa-user fa-lg"></i>
              <%= end %>
            </div>
            <div class="navbar-item__name">
              Perfil
            </div>
          </div>
      </div>
    </div>
    """
  end
end
