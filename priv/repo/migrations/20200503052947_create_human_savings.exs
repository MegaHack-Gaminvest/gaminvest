defmodule Gaminvest.Repo.Migrations.CreateHumanSavings do
  use Ecto.Migration

  def change do
    create table(:human_savings, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :human_id, references("humans", type: :uuid)
      add :amount, :float
    end
  end
end
