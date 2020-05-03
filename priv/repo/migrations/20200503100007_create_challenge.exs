defmodule Gaminvest.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :content, :string

      timestamps()
    end
  end
end
