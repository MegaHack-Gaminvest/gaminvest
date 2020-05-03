defmodule GaminvestWeb.HomeLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.HumanContext

  def mount(_params, _state, socket) do
    socket = socket
    |> assign(:human, fetch_human())
    {:ok, socket}
  end

  def fetch_human do
    HumanContext.get_human!("4c3003cc-f2c5-485d-a7d5-ae17d3a8d9e3")
  end

  def money_format(amount) do
    "R$ #{amount}"
  end

end
