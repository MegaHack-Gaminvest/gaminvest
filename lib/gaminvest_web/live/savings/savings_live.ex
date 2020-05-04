defmodule GaminvestWeb.SavingsLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.{HumanContext, TitleContext}

  def mount(_params, %{"human_id" => human_id}, socket) do
    human = HumanContext.get_human!(human_id)
    socket = socket
    |> assign(:page_title, "Poupança")
    |> assign(:savings, human.savings)
    |> assign(:points, human.points)
    |> assign(:titles, TitleContext.list_titles())
    {:ok, socket, temporary_assigns: [titles: []]}
  end

  def money_format(amount) do
    "R$ #{:erlang.float_to_binary(amount, [decimals: 2])}"
  end
end
