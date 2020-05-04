defmodule Gaminvest.ModuleContext.Phase do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gaminvest.ModuleContext.Module

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "phases" do
    field :name, :string
    field :score, :integer
    field :content, :string
    field :order, :integer
    belongs_to :module, Module, type: :binary_id

    timestamps()
  end

  def changeset(phase, attrs \\ %{}) do
    phase
    |> cast(attrs, [:name, :content, :score])
    |> validate_required([:name, :content, :score])
  end
end
