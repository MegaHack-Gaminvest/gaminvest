defmodule Gaminvest.ModuleContext.HumanPhases do
  use Ecto.Schema

  alias Gaminvest.HumanContext.Human
  alias Gaminvest.ModuleContext.Phase

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "human_phases" do
    field :status, :string
    belongs_to :human, Human, type: :binary_id
    belongs_to :phase, Phase, type: :binary_id
  end
end
