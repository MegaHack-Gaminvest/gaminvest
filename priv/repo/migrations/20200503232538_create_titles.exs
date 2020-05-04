defmodule Gaminvest.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :price, :float
      add :score, :integer

      timestamps()
    end
  end
end
