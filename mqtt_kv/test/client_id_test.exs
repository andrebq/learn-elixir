defmodule ClientIDTest do
  use ExUnit.Case
  doctest ClientID

  test "generate a random id" do
    assert String.length(ClientID.random()) == 23
  end
end
