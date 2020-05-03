defmodule GaminvestWeb.ChallengeLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.ChallengeContext
  alias Gaminvest.HumanContext

  def mount(_params, %{"human_id" => human_id}, socket) do
    if connected?(socket) do
      human = HumanContext.get_human!(human_id)
      ChallengeContext.track_leaderboard(human_id, %{points: :rand.uniform(2000), name: human.name})
    end
    daily_challenge = ChallengeContext.get_daily_challenge!
    socket = socket
      |> assign(:daily_challenge, daily_challenge)
      |> assign(:leaderboard_list, ChallengeContext.leaderboard_list())
      |> assign(socket, :page_title, "Desafios")
    {:ok, socket, temporary_assigns: [leaderboard_list: []]}
  end

  def handle_info(%{event: "presence_diff"}, socket) do
    list = ChallengeContext.leaderboard_list()
    {:noreply, assign(socket, :leaderboard_list, list)}
  end

end
