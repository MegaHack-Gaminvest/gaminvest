defmodule GaminvestWeb.ProfileLive do
  use GaminvestWeb, :live_view

  def mount(_params, %{"human_id" => human_id}, socket) do
    socket = socket
    |> assign(:page_title, "Perfil")
    |> assign(:human, fetch_human(human_id))
    {:ok, assign(socket, :page_title, "Perfil")}
  end

  def fetch_human(human_id), do: Gaminvest.HumanContext.get_human!(human_id)

  def money_format(amount) do
    "R$ #{:erlang.float_to_binary(amount, [decimals: 2])}"
  end
end
