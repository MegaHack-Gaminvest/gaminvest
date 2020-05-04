defmodule Gaminvest.TitleContext do
  alias Gaminvest.TitleContext.Title
  alias Gaminvest.Repo

  def create_title(params) do
    %Title{}
    |> Title.changeset(params)
    |> Repo.insert()
  end

  def list_titles do
    Repo.all(Title)
  end
end
