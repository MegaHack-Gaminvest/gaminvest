defmodule GaminvestWeb.ModuleLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.ModuleContext

  def mount(_params, %{"human_id" => human_id}, socket) do
    progress = ModuleContext.get_progress_for_human(human_id)
    socket = socket
    |> assign(:page_title, "Módulos")
    |> assign(:progress, progress)
    {:ok, socket, temporary_assigns: [progress: %{}]}
  end

  def has_started_module?(%{phases: []}, _module), do: false
  def has_started_module?(%{phases: human_phases}, {module_id, _order}) do
    Enum.any?(human_phases, fn %{phase: phase, status: status} -> status == "IN_PROGRESS" || status == "COMPLETE" && phase.module_id == module_id end)
  end

  def has_completed_module?(%{phases: []}, _module), do: false
  def has_completed_module?(%{phases: human_phases}, {module_id, _order}) do
    module_phases = Enum.filter(human_phases, fn %{phase: phase} -> phase.module_id == module_id end)
    Enum.all?(module_phases, fn %{status: status} -> status == "COMPLETE" end)
  end

  def is_module_locked?(%{phases: []}, {_module_id, 1}), do: false
  def is_module_locked?(%{phases: []}, {_module_id, _order}), do: true

  def button_text(progress, module) do
    cond do
      has_started_module?(progress, module) ->
        "Continuar"
      has_completed_module?(progress, module) ->
        "Finalizado"
      is_module_locked?(progress, module) ->
        "Bloqueado"
      true ->
        "Começar"
    end
  end
end
