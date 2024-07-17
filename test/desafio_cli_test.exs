defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "1501 em romano" do
    assert DesafioCli.valor_em_romano(1501, "") == "MDI"
  end

  test "1523 em romano" do
    assert DesafioCli.valor_em_romano(1523, "") == "MDXXIII"
  end
end
