defmodule GaminvestWeb.API.HumanController do
  use GaminvestWeb, :controller

  alias Gaminvest.HumanContext
  alias Gaminvest.HumanContext.Human

  action_fallback GaminvestWeb.FallbackController

  def index(conn, _params) do
    humans = HumanContext.list_humans()
    render(conn, "index.json", humans: humans)
  end

  def create(conn, %{"human" => human_params}) do
    with {:ok, %Human{} = human} <- HumanContext.create_human(human_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.human_path(conn, :show, human))
      |> render("show.json", human: human)
    end
  end

  def show(conn, %{"id" => id}) do
    human = HumanContext.get_human!(id)
    render(conn, "show.json", human: human)
  end

  def update(conn, %{"id" => id, "human" => human_params}) do
    human = HumanContext.get_human!(id)

    with {:ok, %Human{} = human} <- HumanContext.update_human(human, human_params) do
      render(conn, "show.json", human: human)
    end
  end

  def delete(conn, %{"id" => id}) do
    human = HumanContext.get_human!(id)

    with {:ok, %Human{}} <- HumanContext.delete_human(human) do
      send_resp(conn, :no_content, "")
    end
  end
end
