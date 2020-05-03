defmodule Gaminvest.Repo.Migrations.CreateHumanModule do
  use Ecto.Migration

  def change do
    create table(:human_module_completions, primary_key: false) do
      add :human_id, references("humans", type: :uuid), primary_key: true
      add :module_id, references("modules", type: :uuid), primary_key: true
      add :score, :integer
    end
  end
end
