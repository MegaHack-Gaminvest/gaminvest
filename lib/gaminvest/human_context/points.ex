defmodule Gaminvest.HumanContext.Points do
  use Ecto.Schema

  alias Gaminvest.HumanContext.Human

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "points" do
    field :points, :integer, default: 0
    belongs_to :human, Human, type: :binary_id
  end
end
