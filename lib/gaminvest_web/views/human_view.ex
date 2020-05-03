defmodule GaminvestWeb.API.HumanView do
  use GaminvestWeb, :view
  alias GaminvestWeb.API.{HumanView, SavingsView}

  def render("index.json", %{humans: humans}) do
    %{humans: render_many(humans, HumanView, "human.json")}
  end

  def render("show.json", %{human: human}) do
    %{human: render_one(human, HumanView, "human.json")}
  end

  def render("human.json", %{human: human}) do
    %{id: human.id,
      name: human.name,
      external_id: human.external_id,
      savings: render_one(human.savings, SavingsView, "savings.json")}
  end

end
