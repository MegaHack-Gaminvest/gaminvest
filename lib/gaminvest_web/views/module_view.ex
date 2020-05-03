defmodule GaminvestWeb.API.ModuleView do
  use GaminvestWeb, :view
  alias GaminvestWeb.API.ModuleView
  alias GaminvestWeb.API.PhaseView

  def render("index.json", %{module: module}) do
    %{modules: render_many(module, ModuleView, "module.json")}
  end

  def render("show.json", %{module: module}) do
    %{module: render_one(module, ModuleView, "module.json")}
  end

  def render("module.json", %{module: module}) do
    %{id: module.id,
      name: module.name,
      description: module.description,
      phases: render_many(module.phases, PhaseView, "phase.json"),
      score: module.score}
  end
end
