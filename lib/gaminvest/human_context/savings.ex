defmodule Gaminvest.HumanContext.Savings do
  use Ecto.Schema

  alias Gaminvest.HumanContext.Human

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "savings" do
    field :amount, :float, default: 0
    belongs_to :human, Human, type: :binary_id
  end
end
