defmodule Gaminvest.Repo.Migrations.CreateModule do
  use Ecto.Migration

  def change do
    create table(:modules, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :description, :string
      add :order, :bigserial

      timestamps()
    end
  end
end
