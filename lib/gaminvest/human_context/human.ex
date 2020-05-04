defmodule Gaminvest.HumanContext.Human do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gaminvest.HumanContext.{Savings, Points}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "humans" do
    field :name, :string
    field :email, :string
    has_one :savings, {"human_savings", Savings}
    has_one :points, {"human_points", Points}

    timestamps()
  end

  @doc false
  def changeset(human, attrs) do
    human
    |> cast(attrs, [:name, :email])
    |> cast_assoc(:savings)
    |> validate_required([:name, :email])
  end
end
