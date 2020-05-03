defmodule Gaminvest.ModuleContextTest do
  use Gaminvest.DataCase

  alias Gaminvest.ModuleContext

  describe "module" do
    alias Gaminvest.ModuleContext.Module

    @valid_attrs %{description: "some description", name: "some name", totalPoints: 42}
    @update_attrs %{description: "some updated description", name: "some updated name", totalPoints: 43}
    @invalid_attrs %{description: nil, name: nil, totalPoints: nil}

    def module_fixture(attrs \\ %{}) do
      {:ok, module} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ModuleContext.create_module()

      module
    end

    test "list_module/0 returns all module" do
      module = module_fixture()
      assert ModuleContext.list_module() == [module]
    end

    test "get_module!/1 returns the module with given id" do
      module = module_fixture()
      assert ModuleContext.get_module!(module.id) == module
    end

    test "create_module/1 with valid data creates a module" do
      assert {:ok, %Module{} = module} = ModuleContext.create_module(@valid_attrs)
      assert module.description == "some description"
      assert module.name == "some name"
      assert module.totalPoints == 42
    end

    test "create_module/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ModuleContext.create_module(@invalid_attrs)
    end

    test "update_module/2 with valid data updates the module" do
      module = module_fixture()
      assert {:ok, %Module{} = module} = ModuleContext.update_module(module, @update_attrs)
      assert module.description == "some updated description"
      assert module.name == "some updated name"
      assert module.totalPoints == 43
    end

    test "update_module/2 with invalid data returns error changeset" do
      module = module_fixture()
      assert {:error, %Ecto.Changeset{}} = ModuleContext.update_module(module, @invalid_attrs)
      assert module == ModuleContext.get_module!(module.id)
    end

    test "delete_module/1 deletes the module" do
      module = module_fixture()
      assert {:ok, %Module{}} = ModuleContext.delete_module(module)
      assert_raise Ecto.NoResultsError, fn -> ModuleContext.get_module!(module.id) end
    end

    test "change_module/1 returns a module changeset" do
      module = module_fixture()
      assert %Ecto.Changeset{} = ModuleContext.change_module(module)
    end
  end
end
