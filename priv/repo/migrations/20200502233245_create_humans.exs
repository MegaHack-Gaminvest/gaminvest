defmodule Gaminvest.Repo.Migrations.CreateHumans do
  use Ecto.Migration

  def change do
    create table(:humans, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :external_id, :string

      timestamps()
    end

  end
end
