defmodule GaminvestWeb.ChallengeLive do
  use GaminvestWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Desafios")}
  end

end
