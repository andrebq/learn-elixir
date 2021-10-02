defmodule ClientID do
  @moduledoc """
  Documentation for `ClientID`.
  """

  @doc """
  Returns a random user ID

  ## Examples

      iex> ClientID.random()
  """
  def random() do
    symbols = "0123456789abcdefghijklmnopqrstuvxywzABCDEFGHIJKLMNOPQRSTUVXYWZ"
    symbol_count = String.length(symbols)
    new_id = for _ <- 1..23, into: "", do: String.at(symbols, :rand.uniform(symbol_count) - 1)
    new_id
  end
end
