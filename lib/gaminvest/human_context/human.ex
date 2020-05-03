defmodule Gaminvest.HumanContext.Human do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gaminvest.HumanContext.Savings

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "humans" do
    field :external_id, :string
    field :name, :string
    has_one :savings, {"human_savings", Savings}

    timestamps()
  end

  @doc false
  def changeset(human, attrs) do
    human
    |> cast(attrs, [:name, :external_id])
    |> cast_assoc(:savings)
    |> validate_required([:name, :external_id])
  end
end