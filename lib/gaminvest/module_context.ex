defmodule Gaminvest.ModuleContext do
  @moduledoc """
  The ModuleContext context.
  """

  import Ecto.Query, warn: false

  alias Gaminvest.Repo
  alias Gaminvest.ModuleContext.{Module, Phase, HumanPhases}
  alias Ecto.Multi

  defp module_phase_query do
    from m in Module,
    join: p in Phase, as: :phase,
    on: m.id == p.module_id,
    preload: [phases: p]
  end

  @doc """
  Returns the list of module.

  ## Examples

      iex> list_modules()
      [%Module{}, ...]

  """
  def list_modules do
    modules = Repo.all(module_phase_query())
    map_with_score(modules)
  end

  def get_phases_in_progress_for_humans(human_id) do
    phases = Repo.all(
      from hp in HumanPhases,
      join: p in Phase, on: hp.phase_id == p.id,
      select: %{phase: p, status: hp.status},
      where: hp.human_id == ^human_id and hp.status == "IN_PROGRESS"
    )
    phases
  end

  defp get_first_phase_for_module(module_id) do
    Repo.one(from p in Phase, select: p.id, where: p.order == 1 and p.module_id == ^module_id, limit: 1)
  end

  def start_progress_for_human_in_module(module_id, human_id) do
    phase_id = get_first_phase_for_module(module_id)
    %HumanPhases{}
    |> HumanPhases.changeset(%{phase_id: phase_id, human_id: human_id, status: "IN_PROGRESS"})
    |> Repo.insert()
  end

  def get_next_phase_for_module(module_id, human_id, previous_phase_id) do
    Repo.one(
      from hp in HumanPhases,
      join: previous_phase in Phase, on: hp.phase_id == previous_phase.id,
      join: next_phase in Phase, on: next_phase.order == previous_phase.order + 1,
      select: next_phase,
      where: previous_phase.module_id == ^module_id and hp.human_id == ^human_id and previous_phase.id == ^previous_phase_id
    )
  end

  def continue_progress_for_human_in_module(module_id, human_id) do
    human_phase = Repo.one(
      from hp in HumanPhases,
      join: p in Phase, on: p.id == hp.phase_id,
      join: m in Module, on: p.module_id == m.id,
      where: hp.human_id == ^human_id and hp.status == "IN_PROGRESS",
      select: hp
    )
    multi = Multi.new()
    |> Multi.update(:complete_previous_phase, HumanPhases.changeset(human_phase, %{status: "COMPLETE"}))
    next_phase = get_next_phase_for_module(module_id, human_phase.human_id, human_phase.phase_id)

    multi = case next_phase do
      phase ->
        multi
        |> Multi.insert(:add_new_phase, HumanPhases.changeset(%HumanPhases{}, %{phase_id: phase.id, human_id: human_id, status: "IN_PROGRESS"}))
      nil ->
        multi
    end
    {:ok, _} = Repo.transaction(multi)
    {:ok, next_phase}
  end

  def get_phase!(id), do: Repo.get!(Phase, id)

  @doc """
  Gets a single module.

  Raises `Ecto.NoResultsError` if the Module does not exist.

  ## Examples

      iex> get_module!(123)
      %Module{}

      iex> get_module!(456)
      ** (Ecto.NoResultsError)

  """
  def get_module!(id) do
    module_query = module_phase_query()
    module = Repo.one!(from m in module_query, where: m.id == ^id)
    with_score(module)
  end

  defp with_score({:ok, %Module{} = module}) do
    {:ok, with_score(module)}
  end

  defp with_score(%Module{phases: phases} = module) do
    score = Enum.reduce(phases, 0, fn %Phase{score: score}, total_score -> total_score + score end)
    %Module{module | score: score}
  end

  defp map_with_score(modules) do
    Enum.map(modules, &with_score/1)
  end

  @doc """
  Creates a module.

  ## Examples

      iex> create_module(%{field: value})
      {:ok, %Module{}}

      iex> create_module(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_module(attrs \\ %{}) do
    %Module{}
    |> Module.changeset(attrs)
    |> Repo.insert()
    |> with_score()
  end

  @doc """
  Updates a module.

  ## Examples

      iex> update_module(module, %{field: new_value})
      {:ok, %Module{}}

      iex> update_module(module, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_module(%Module{} = module, attrs) do
    module
    |> Module.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a module.

  ## Examples

      iex> delete_module(module)
      {:ok, %Module{}}

      iex> delete_module(module)
      {:error, %Ecto.Changeset{}}

  """
  def delete_module(%Module{} = module) do
    Repo.delete(module)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking module changes.

  ## Examples

      iex> change_module(module)
      %Ecto.Changeset{data: %Module{}}

  """
  def change_module(%Module{} = module, attrs \\ %{}) do
    Module.changeset(module, attrs)
  end

  # def register_completion!(%{phase_id: phase_id, human_id: human_id}) do
  #   Repo.query!(
  #     """
  #     """,
  #     [phase_id, human_id]
  #   )
  # end
end
