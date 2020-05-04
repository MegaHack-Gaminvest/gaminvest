defmodule GaminvestWeb.HomeLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.HumanContext

  def mount(_params, %{"human_id" => human_id}, socket) do
    socket = socket
    |> assign(:human, fetch_human(human_id))
    |> assign(:page_title, "Home")
    {:ok, socket}
  end

  def fetch_human(id) do
    HumanContext.get_human!(id)
  end

  def money_format(amount) do
    "R$ #{:erlang.float_to_binary(amount, [decimals: 2])}"
  end

end
