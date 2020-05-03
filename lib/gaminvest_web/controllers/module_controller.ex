defmodule GaminvestWeb.API.ModuleController do
  use GaminvestWeb, :controller

  alias Gaminvest.ModuleContext
  alias Gaminvest.ModuleContext.Module

  action_fallback GaminvestWeb.FallbackController

  def index(conn, _params) do
    module = ModuleContext.list_module()
    render(conn, "index.json", module: module)
  end

  def create(conn, %{"module" => module_params}) do
    with {:ok, %Module{} = module} <- ModuleContext.create_module(module_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.module_path(conn, :show, module))
      |> render("show.json", module: module)
    end
  end

  def show(conn, %{"id" => id}) do
    module = ModuleContext.get_module!(id)
    render(conn, "show.json", module: module)
  end

  def update(conn, %{"id" => id, "module" => module_params}) do
    module = ModuleContext.get_module!(id)

    with {:ok, %Module{} = module} <- ModuleContext.update_module(module, module_params) do
      render(conn, "show.json", module: module)
    end
  end

  def delete(conn, %{"id" => id}) do
    module = ModuleContext.get_module!(id)

    with {:ok, %Module{}} <- ModuleContext.delete_module(module) do
      send_resp(conn, :no_content, "")
    end
  end

  def complete(conn, %{"id" => id}) do
    IO.puts("ID: #{inspect(id)}")
    send_resp(conn, :ok, "")
  end
end
