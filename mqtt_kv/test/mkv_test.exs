defmodule MKVTest do
  use ExUnit.Case
  doctest MKV

  test "greets the world" do
    assert MKV.init([]) == :ok
  end
end
