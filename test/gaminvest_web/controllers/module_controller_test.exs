defmodule GaminvestWeb.ModuleControllerTest do
  use GaminvestWeb.ConnCase

  alias Gaminvest.ModuleContext
  alias Gaminvest.ModuleContext.Module

  @create_attrs %{
    description: "some description",
    name: "some name",
    totalPoints: 42
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    totalPoints: 43
  }
  @invalid_attrs %{description: nil, name: nil, totalPoints: nil}

  def fixture(:module) do
    {:ok, module} = ModuleContext.create_module(@create_attrs)
    module
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all module", %{conn: conn} do
      conn = get(conn, Routes.module_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create module" do
    test "renders module when data is valid", %{conn: conn} do
      conn = post(conn, Routes.module_path(conn, :create), module: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.module_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "totalPoints" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.module_path(conn, :create), module: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update module" do
    setup [:create_module]

    test "renders module when data is valid", %{conn: conn, module: %Module{id: id} = module} do
      conn = put(conn, Routes.module_path(conn, :update, module), module: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.module_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "totalPoints" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, module: module} do
      conn = put(conn, Routes.module_path(conn, :update, module), module: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete module" do
    setup [:create_module]

    test "deletes chosen module", %{conn: conn, module: module} do
      conn = delete(conn, Routes.module_path(conn, :delete, module))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.module_path(conn, :show, module))
      end
    end
  end

  defp create_module(_) do
    module = fixture(:module)
    %{module: module}
  end
end
