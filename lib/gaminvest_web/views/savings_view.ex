defmodule GaminvestWeb.API.SavingsView do
  use GaminvestWeb, :view

  def render("savings.json", %{savings: savings}) do
    %{amount: savings.amount}
  end
end
