defmodule Gaminvest.Repo.Migrations.CreateHumanPhases do
  use Ecto.Migration

  def change do
    create table(:human_phases, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :human_id, references("humans", type: :uuid)
      add :phase_id, references("phases", type: :uuid)
      add :status, :string
    end
  end
end
