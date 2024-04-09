defmodule AdventOfElixirTest do
  use ExUnit.Case
  doctest AdventOfElixir

  test "greets the world" do
    assert AdventOfElixir.hello() == :world
  end
end
