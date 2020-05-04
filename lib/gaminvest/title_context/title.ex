defmodule Gaminvest.TitleContext.Title do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "titles" do
    field :name, :string
    field :price, :float
    field :score, :integer

    timestamps()
  end

  def changeset(title, params \\ %{}) do
    title
    |> cast(params, [:name, :price, :score])
    |> validate_required([:name, :price, :score])
  end
end
