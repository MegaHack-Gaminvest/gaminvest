defmodule GaminvestWeb.Plugs.CreateRandomUser do
  import Plug.Conn
  alias Gaminvest.HumanContext
  alias Gaminvest.HumanContext.{Savings}

  def init(default), do: default

  def call(conn, _params) do
    {:ok, random_human} = HumanContext.create_human(%{
      name: Faker.Name.name(),
    })
    conn
    |> put_session(:human_id, random_human.id)
  end

end
