defmodule Gaminvest.Repo.Migrations.CreateHumanPoints do
  use Ecto.Migration

  def change do
    create table(:human_points, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :human_id, references("humans", type: :uuid)
      add :points, :integer
    end
  end
end
