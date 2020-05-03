defmodule GaminvestWeb.API.PhaseView do
  use GaminvestWeb, :view

  def render("phase.json", %{phase: phase}) do
    %{id: phase.id,
      name: phase.name,
      content: phase.content,
      score: phase.score}
  end
end
