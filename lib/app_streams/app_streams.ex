defmodule ExPnut.AppStreams do
  import ExPnut.Helper.HTTP

  @moduledoc """
  App streams are long-lasting connections between the API and your server, often for notifications and other
  applications that need instant updates.

  You will need an app token to use them. Look at How To: App Streams for details on usage.

  Endpoints:
  - Get all streams
  - Get a stream
  - Create a stream
  - Update a stream
  - Delete all streams
  - Delete a stream

  [https://pnut.io/docs/api/resources/app-streams](https://pnut.io/docs/api/resources/app-streams)
  """

  @doc """
  Get all app streams for the authenticated app.

  Returns a list of streams.
  """
  def get_streams(client) do
    get(client, "/streams")
  end

  @doc """
  Get a specific app stream by its key.

  Returns the requested stream.

  ## Parameters

  - stream_key: Stream to retrieve.
  """
  def get_by_stream_key(client, stream_key) do
    get(client, "/streams/#{stream_key}")
  end
end
