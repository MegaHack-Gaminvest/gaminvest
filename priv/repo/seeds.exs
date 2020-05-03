# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Gaminvest.Repo.insert!(%Gaminvest.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Gaminvest.Repo
alias Gaminvest.ModuleContext.{Module, Phase}
alias Gaminvest.ChallengeContext
alias Gaminvest.ChallengeContext.Challenge

Repo.insert! %Challenge{title: "Fundos imobiliários FTW!", content: """
Invista mais rápido para ganhar recompensas!
<ul>
  <li>Primeiros 10 a comprar o FI ABCP11: 50 pontos</li>
  <li>Primeiros 25 a comprar o FI ABCP11: 25 pontos</li>
  <li>Recompensa normal: 10 pontos</li>
</ul>
"""}
