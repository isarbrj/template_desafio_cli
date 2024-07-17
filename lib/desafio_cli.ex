defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts(
      "Escreva os nomes dos reis, um por linha, ao final deixe uma linha em branco e dê enter:"
    )

    le_lista([])
  end

  @romanos [{1, "I"}, {4, "IV"}, {5, "V"}, {9, "IX"}, {10, "X"}, {40, "XL"}, {50, "L"}, {90, "XC"}, {100, "C"}, {500, "D"}, {1000, "M"}]

  def valor_em_romano(valor, romano) do
    if valor == 0 do
      romano
    else
      {arabico, algarismo} = Enum.find(Enum.reverse(@romanos), fn {arabico, _} -> valor >= arabico end)
      valor_em_romano(valor-arabico,"#{romano}#{algarismo}")
    end

  end

  def le_lista(lista) do
    nome = IO.gets("")

    if nome == "\n" do
        Enum.reduce(lista, %{}, fn pessoa, contagem ->
          conte = Map.update(contagem, pessoa, 1, fn val -> val + 1 end)
          IO.puts("#{pessoa} #{valor_em_romano(Map.get(conte, pessoa),"")}")
          conte
        end)
    else
      nova_lista = lista ++ [String.trim(nome)]
      le_lista(nova_lista)
    end
  end
end
