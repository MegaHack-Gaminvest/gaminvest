defmodule Gaminvest.HumanContextTest do
  use Gaminvest.DataCase

  alias Gaminvest.HumanContext

  describe "humans" do
    alias Gaminvest.HumanContext.Human

    @valid_attrs %{external_id: "some external_id", name: "some name"}
    @update_attrs %{external_id: "some updated external_id", name: "some updated name"}
    @invalid_attrs %{external_id: nil, name: nil}

    def human_fixture(attrs \\ %{}) do
      {:ok, human} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HumanContext.create_human()

      human
    end

    test "list_humans/0 returns all humans" do
      human = human_fixture()
      assert HumanContext.list_humans() == [human]
    end

    test "get_human!/1 returns the human with given id" do
      human = human_fixture()
      assert HumanContext.get_human!(human.id) == human
    end

    test "create_human/1 with valid data creates a human" do
      assert {:ok, %Human{} = human} = HumanContext.create_human(@valid_attrs)
      assert human.external_id == "some external_id"
      assert human.name == "some name"
    end

    test "create_human/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HumanContext.create_human(@invalid_attrs)
    end

    test "update_human/2 with valid data updates the human" do
      human = human_fixture()
      assert {:ok, %Human{} = human} = HumanContext.update_human(human, @update_attrs)
      assert human.external_id == "some updated external_id"
      assert human.name == "some updated name"
    end

    test "update_human/2 with invalid data returns error changeset" do
      human = human_fixture()
      assert {:error, %Ecto.Changeset{}} = HumanContext.update_human(human, @invalid_attrs)
      assert human == HumanContext.get_human!(human.id)
    end

    test "delete_human/1 deletes the human" do
      human = human_fixture()
      assert {:ok, %Human{}} = HumanContext.delete_human(human)
      assert_raise Ecto.NoResultsError, fn -> HumanContext.get_human!(human.id) end
    end

    test "change_human/1 returns a human changeset" do
      human = human_fixture()
      assert %Ecto.Changeset{} = HumanContext.change_human(human)
    end
  end
end
