defmodule MKV do
  @moduledoc """
  `MKV` provides a simple KV connected to MQTT

  When a key changes in the store it will send a message
  to the MQTT broker with information about the change.

  Consumers can then listen for changes that happen on a
  given bucket.

  """

  @doc """
  Start the MQTT KV engine by connecting to localhost:1883

  ## Examples

      iex> MKV.init([])
      :ok

  """
  def init(opts) do
    my_id =
      case List.keyfind(opts, :client_id, 0) do
        {:client_id, provided_id} -> provided_id
        _ -> ClientID.random()
      end

    {:ok, _pid} =
      Tortoise.Connection.start_link(
        client_id: my_id,
        server: {Tortoise.Transport.Tcp, host: 'localhost', port: 1883},
        handler: {Tortoise.Handler.Logger, []},
        will: %Tortoise.Package.Publish{topic: "client/disconnect", payload: "goodbye"}
      )

    Tortoise.publish(my_id, "client/salute", "Hello world", qos: 1)

    receive do
      {{Tortoise, ^my_id}, _reference, :ok} -> :ok
    after
      1_000 -> :error
    end
  end
end
