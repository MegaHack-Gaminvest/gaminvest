defmodule Gaminvest.ChallengeContext do
  import Ecto.Query, warn: false

  alias Gaminvest.Repo
  alias Gaminvest.ChallengeContext.Challenge
  alias Gaminvest.PubSub
  alias GaminvestWeb.Presence

  @leaderboard_topic "leaderboard"

  def get_daily_challenge! do
    Repo.one!(from c in Challenge, select: c)
  end

  def track_leaderboard(key, meta) do
    Phoenix.PubSub.subscribe(PubSub, @leaderboard_topic)
    {:ok, _} = Presence.track(
      self(),
      @leaderboard_topic,
      key,
      meta
    )
  end

  def leaderboard_list do
    Presence.list(@leaderboard_topic)
  end

end
