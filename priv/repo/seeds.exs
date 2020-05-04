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
alias Gaminvest.ModuleContext
alias Gaminvest.ChallengeContext.Challenge
alias Gaminvest.TitleContext
alias Gaminvest.TitleContext.Title

Repo.insert! %Challenge{title: "Fundos imobiliários FTW!", content: """
Invista mais rápido para ganhar recompensas!
<ul>
  <li>Primeiros 10 a comprar o FI ABCP11: 50 pontos</li>
  <li>Primeiros 25 a comprar o FI ABCP11: 25 pontos</li>
  <li>Recompensa normal: 10 pontos</li>
</ul>
"""}

ModuleContext.create_module %{name: "Básico",
                              description: "Um resumo sobre noções básicas de investimento.",
                              phases: [
                                %{name: "Fase 1: Tipos de Investimento",
                                  score: 50,
                                  content: """
<p>Este módulo descreve alguns dos principais tipos de investimento, tal abordagem tem como objetivo informar aos leitores sobre as peculiaridades de cada tipo de investimento, tal como suas rentabilidades, prazos, liquidez, informar também a diferença entre investimento de renda fixa e variável.</p>
<p>Essa tarefa será realizada através de revisão bibliográfica. O artigo se justifica pelo fato de informar aos leitores sobre os tipos de investimento mais utilizados na atualidade, e assim, os mesmos terem capacidade de discernir qual o investimento mais viável em seu caso.</p>
<p>É importante sabermos onde e como podemos investir, para assim obtermos lucro e rentabilidade nos investimento, observando que o país não vive um bom momento politico e financeiro, então, quando pode-se ter um renda extra, neste caso com investimentos, pode-se aliviar o atual momento que vivemos.</p>
<p>O estudo comprovou que há investimento para todos os tipos de investidores, desde investidores conservadores até arrojados.</p>
<strong>Palavras-chave: Investimento. Rentabilidade. Liquidez, Tributação</strong>
                                  """},
                                 %{name: "Fase 2: Risco",
                                   score: 45,
                                   content: """
<p>De acordo com ROOS, WESTERFIELD e JAFFE (2002 p. 189) “os investidores só aplicação num título com risco se seu retorno esperado for suficientemente elevado para compensar esse risco”.</p>
<p>Ou seja, o risco pode ser entendido como uma incerteza, que o investidor optará, acreditado que conseguirá obter um retorno satisfatório. Sempre o investidor se deparará entre duas situações com riscos distintos, como exemplo, uma com rentabilidade e risco maior e outra com rentabilidade e risco menor, é o investidor que vai decidir onde realizará o investimento, se ele for arrojado, escolherá a primeira e se for cauteloso escolherá a segunda. Seabra (2010) diz que “os ativos com características distintas tendem a obter retornos distintos e a seguir diferentes tendências”.</p>
                                   """},
                                   %{name: "Fase 3: Rentabilidade",
                                     score: 40,
                                     content: """
<p>De uma forma geral, rentabilidade é o prêmio recebido pelo investidor pelo capital investido.</p>
<p>Nos investimentos, rentabilidade é o retorno sobre o capital investido em determinado ativo financeiro. Ele pode ser dado através de taxa de juros prefixadas (os títulos públicos LT e NTN-F, por exemplo), pós-fixadas (LFT, título indexado à taxa SELIC, CDBs, entre outros), mistas (poupança que rende 0,5% a.m. + TR ou NTN-B, que rende em torno de 6% a.a. + IPCA) ou baseadas na valorização (como no caso das ações, que a diferença entre o preço de compra e o preço de venda determina a rentabilidade, podendo ser positiva ou negativa). (TAVARES, 2010 p. 01).</p>
<p>Rentabilidade é diferente de lucratividade, como diz LAVERGEL (2011 p.01) “enquanto lucratividade reflete os ganhos imediatos do negócio, a rentabilidade mostra qual é o retorno sobre o investimento que foi feito na empresa a longo prazo”, ou seja, lucratividade refere-se ao ganho na operação, seja ele grande ou pequeno, a rentabilidade tende a ser mais abrangente, mostrando o retorno sobre o capital investido, na maioria das vezes em forma de porcentagem.</p>
                                     """}
                              ]}

ModuleContext.create_module %{name: "Intermediário",
                              description: "Um resumo sobre noções mais aprofundadas sobre o mercado financeiro, economia e investimento",
                              phases: [
                                %{name: "Fase 1: Noções de Economia",
                                  score: 50,
                                  content: """
<p>Economia (ciência económica (pt) ou ciência econômica (pt-BR)) é uma ciência que consiste na análise da produção, distribuição e consumo de bens e serviços. É também a ciência social que estuda a atividade económica, através da aplicação da teoria económica, tendo, na gestão, a sua aplicabilidade prática. O termo economia vem do grego οικονομία (de οἶκος, translit. oikos, 'casa' + νόμος , translit. nomos, 'costume ou lei', ou também 'gerir, administrar': daí "regras da casa" ou "administração doméstica".</p>
<p>Os modelos e técnicas atualmente usados em economia evoluíram da economia política do final do século XIX, derivado da vontade de usar métodos mais empíricos à semelhança das ciências naturais.[2] Pode representar, em sentido lato, a situação económica de um país ou região; isto é, a sua situação conjuntural (relativamente aos ciclos da economia) ou estrutural.</p>
<p>A economia é, geralmente, dividida em dois grandes ramos: a microeconomia, que estuda os comportamentos individuais, e a macroeconomia, que estuda o resultado agregado dos vários comportamentos individuais. Atualmente, a economia aplica o seu corpo de conhecimento para análise e gestão dos mais variados tipos de organizações humanas (entidades públicas, empresas privadas, cooperativas etc.) e domínios (internacional, finanças, desenvolvimento dos países, ambiente, mercado de trabalho, cultura, agricultura, etc.).</p>
<p>Outras formas de divisão da disciplina são: a distinção entre economia positiva ("o que é", que tenta explicar o comportamento ou fenômeno econômico observado) e economia normativa ("o que deveria ser", frequentemente relacionado com políticas públicas); a distinção entre economia ortodoxa, aquela que lida com o nexo "racionalidade-individualismo-equilíbrio", e a economia heterodoxa, que pode ser definida por um nexo "instituições-história-estrutura social".</p>
                                  """}
                              ]}


TitleContext.create_title %{name: "Fundo Imobiliário DAMT11B", price: 45.0, score: 25}
TitleContext.create_title %{name: "Fundo Imobiliário DRIT11B", price: 50.0, score: 30}
TitleContext.create_title %{name: "Fundo Imobiliário EURO11", price: 12.0, score: 15}
