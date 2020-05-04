defmodule Gaminvest.ModuleContext.HumanPhases do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gaminvest.HumanContext.Human
  alias Gaminvest.ModuleContext.Phase

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "human_phases" do
    field :status, :string
    belongs_to :human, Human, type: :binary_id
    belongs_to :phase, Phase, type: :binary_id
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:status, :human_id, :phase_id])
    |> validate_required([:status, :human_id, :phase_id])
  end
end
