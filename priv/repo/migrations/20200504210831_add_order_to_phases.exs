defmodule Gaminvest.Repo.Migrations.AddOrderToPhases do
  use Ecto.Migration

  def up do
    alter table(:phases) do
      add :order, :bigserial
    end
  end

  def down do
    alter table(:phases) do
      remove :order
    end
  end
end
