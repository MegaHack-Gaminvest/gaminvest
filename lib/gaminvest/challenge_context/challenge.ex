defmodule Gaminvest.ChallengeContext.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "challenges" do
    field :title, :string
    field :content, :string

    timestamps()
  end
end
