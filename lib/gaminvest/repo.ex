defmodule Gaminvest.Repo do
  use Ecto.Repo,
    otp_app: :gaminvest,
    adapter: Ecto.Adapters.Postgres
end
