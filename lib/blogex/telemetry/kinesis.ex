defmodule Blogex.Telemetry.KinesisReporter do
    require Logger

    def handle_event(tags, params, metadata, _config) do
      GenServer.cast(Blogex.Telemetry.KinesisAgent, [tags, params, metadata])
      Logger.info("Received following Tag(s) #{Enum.join(tags, ", ")} in this event.")
    end
  end


defmodule Blogex.Telemetry.KinesisAgent do
    use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(client) do
        {:ok, client}
  end

  def handle_cast([tags, params, metadata], state) do
    base64_data = %{ts: DateTime.utc_now |> DateTime.to_unix, tags: tags, params: params, metadata: inspect(metadata)} |> Jason.encode! |> Base.encode64();
    IO.inspect AWS.Kinesis.put_record(Blogex.AWS.client, %{Data: base64_data,  PartitionKey: Ecto.UUID.generate, StreamARN: "arn:aws:kinesis:eu-west-1:227627864950:stream/blogex-kinesis-stream"});
    {:noreply, state}
  end
end