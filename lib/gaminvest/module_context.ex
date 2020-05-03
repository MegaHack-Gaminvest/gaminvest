defmodule Gaminvest.ModuleContext do
  @moduledoc """
  The ModuleContext context.
  """

  import Ecto.Query, warn: false
  alias Gaminvest.Repo

  alias Gaminvest.ModuleContext.Module
  alias Gaminvest.ModuleContext.Phase

  defp module_phase_query do
    from m in Module,
    join: p in Phase,
    on: m.id == p.module_id,
    preload: [phases: p]
  end

  @doc """
  Returns the list of module.

  ## Examples

      iex> list_module()
      [%Module{}, ...]

  """
  def list_module do
    modules = Repo.all(module_phase_query())
    map_with_score(modules)
  end

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
