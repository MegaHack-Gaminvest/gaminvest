defmodule GaminvestWeb.HeaderComponent do
    use GaminvestWeb, :live_component
  
    def render(assigns) do
        ~L"""
            <div class="<%= @classname %> header">
                <div class="header__content">
                    <div class="header__text">
                        <%= @page_title %>
                    </div>
                </div>
            </div>
        """
    end
end