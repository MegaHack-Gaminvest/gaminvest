defmodule GaminvestWeb.ChallengeLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.ChallengeContext
  alias Gaminvest.HumanContext
  alias Gaminvest.HumanContext.Human

  def mount(_params, %{"human_id" => human_id}, socket) do
    if connected?(socket) do
      ChallengeContext.track_leaderboard(human_id, %{})
    end
    daily_challenge = ChallengeContext.get_daily_challenge!()
    socket = socket
      |> assign(:daily_challenge, daily_challenge)
      |> assign(:leaderboard_list, map_from_presence())
      |> assign(:human_id, human_id)
      |> assign(:page_title, "Desafios")
    {:ok, socket, temporary_assigns: [leaderboard_list: []]}
  end

  def map_from_presence do
    list = ChallengeContext.leaderboard_list()
    humans_list = for {human_id, _metas} <- list do
      %{human: HumanContext.get_human!(human_id)}
    end
    Enum.sort_by(humans_list, fn %{human: human} -> human.points.points end)
  end

  def handle_info(%{event: "presence_diff"}, socket) do
    {:noreply, assign(socket, :leaderboard_list, map_from_presence())}
  end

end
