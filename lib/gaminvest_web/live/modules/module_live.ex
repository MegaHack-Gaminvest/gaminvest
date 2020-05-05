defmodule GaminvestWeb.ModuleLive do
  use GaminvestWeb, :live_view

  alias Gaminvest.ModuleContext

  def mount(_params, %{"human_id" => human_id}, socket) do
    phases_in_progress = ModuleContext.get_phases_in_progress_for_humans(human_id)
    socket = socket
    |> assign(:page_title, "Módulos")
    |> assign(:phases_in_progress, phases_in_progress)
    |> assign(:modules, ModuleContext.list_modules())
    |> assign(:human_id, human_id)
    {:ok, socket}
  end

  def handle_params(%{"phase_id" => phase_id}, _url, socket) do
    phase = ModuleContext.get_phase!(phase_id)
    socket = socket
    |> assign(:phase, phase)
    |> assign(:page_title, phase.name)
    {:noreply, socket}
  end
  def handle_params(%{}, _url, socket) do
    socket = socket
    |> assign(:page_title, "Módulos")
    |> assign(:phases_in_progress, ModuleContext.get_phases_in_progress_for_humans(socket.assigns.human_id))
    {:noreply, socket}
  end

  def has_started_module?([], _module), do: false
  def has_started_module?(phases_in_progress, {module_id, _order}) do
    Enum.any?(phases_in_progress, fn %{phase: phase, status: status} -> status == "IN_PROGRESS" && phase.module_id == module_id end)
  end

  def has_completed_module?([], _module), do: false
  def has_completed_module?(human_phases, {module_id, _order}) do
    module_phases = Enum.filter(human_phases, fn %{phase: phase} -> phase.module_id == module_id end)
    if Enum.empty?(module_phases) do
      false
    else
      Enum.all?(module_phases, fn %{status: status} -> status == "COMPLETE" end)
    end
  end

  def is_module_locked?([], {_module_id, 1}, _), do: false
  def is_module_locked?(phases_in_progress, {module_id, order}, modules) do
    # is locked only if the previous module has not finished
    previous_module = Enum.find(modules, fn module -> module.order == order - 1 end)
    if is_nil(previous_module) do
      false
    else
      !has_completed_module?(phases_in_progress, {previous_module, previous_module.order})
    end
  end

  def button_text(progress, module, modules) do
    cond do
      has_started_module?(progress, module) ->
        "Continuar"
      has_completed_module?(progress, module) ->
        "Finalizado"
      is_module_locked?(progress, module, modules) ->
        "Bloqueado"
      true ->
        "Começar"
    end
  end

  def determine_event_for(progress, module, modules) do
    cond do
      has_started_module?(progress, module) ->
        "module-continue"
      has_completed_module?(progress, module) ->
        "noop"
      is_module_locked?(progress, module, modules) ->
        "noop"
      true ->
        "module-start"
    end
  end

  def handle_event("module-start", %{"module_id" => module_id}, socket) do
    {:ok, phase} = ModuleContext.start_progress_for_human_in_module(module_id, socket.assigns.human_id)
    {:noreply, push_patch(socket, to: "/modules/#{phase.phase_id}")}
  end

  def handle_event("module-continue", %{"module_id" => module_id}, socket) do
    phase_in_progress = Enum.find(socket.assigns.phases_in_progress, &(&1.status == "IN_PROGRESS"))
    {:noreply, push_patch(socket, to: "/modules/#{phase_in_progress.phase.id}")}
  end

  def handle_event("module-next", %{"module_id" => module_id}, socket) do
    {:ok, next_phase} = ModuleContext.continue_progress_for_human_in_module(module_id, socket.assigns.human_id)
    {:noreply, push_patch(socket, to: "/modules/#{next_phase.id}")}
  end

end
