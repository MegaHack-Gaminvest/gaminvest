defmodule Gaminvest.ModuleContext.Module do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gaminvest.ModuleContext.Phase

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "modules" do
    field :description, :string
    field :name, :string
    field :score, :integer, virtual: true
    has_many :phases, Phase

    timestamps()
  end

  @doc false
  def changeset(module, attrs) do
    module
    |> cast(attrs, [:name, :description])
    |> cast_assoc(:phases)
    |> validate_required([:name, :description])
  end
end
