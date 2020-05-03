defmodule Gaminvest.Repo.Migrations.CreatePhase do
  use Ecto.Migration

  def change do
    create table(:phases, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :content, :string
      add :score, :integer
      add :module_id, references("modules", type: :uuid)

      timestamps()
    end
  end
end
