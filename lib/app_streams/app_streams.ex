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

  @doc """
  Create an app stream for the authenticated app. Can create up to five (5) app streams.

  Must have a Content-Type of `application/json`.

  Returns the created stream.

  ## Parameters

  - type: The only value currently allowed is `long_poll`.
  - object_types: List of object types to listen for. Valid values are `post`, `bookmark`, `follow`, `mute`, `block`,
  `message`, `channel`, `channel_subscription`, `token`, `file`, `poll`, and `user`.
  - key: Optional name for the stream, instead of an automatically assigned numeric key. Alphanumeric and underscore
  allowed, 32 characters, unique for this app.

  ## Examples

    iex> ExPnut.AppStreams.create_stream(client, %{"type" => "long_poll", "object_types" => ["post", "bookmark", "message"]})
  """
  def create_stream(client, stream_options) do
    stream = ExPnut.Helper.JSON.jsonify(stream_options)

    post(client, "/streams", stream)
  end

  @doc """
  Update an app stream. Note that, currently, any connected app streams will not be updated until the app disconnects
  and reconnects.

  The only changeable field currently is `object_types`.

  ## Parameters

  - stream_key: Stream to update.

  ## Examples

    iex> ExPnut.AppStreams.update_stream(client, "butterball", %{"object_types" => ["post"]})
  """
  def update_stream(client, stream_key, object_types) do
    object_types_jsonified = ExPnut.Helper.JSON.jsonify(object_types)

    put_json(client, "/streams/#{stream_key}", object_types_jsonified)
  end

  @doc """
  Delete all app streams for the authorized app.

  Returns a list of deleted streams.

  ## Examples

    iex> ExPnut.AppStreams.delete_streams(client)
  """
  def delete_streams(client) do
    delete(client, "/streams")
  end

  @doc """
  Delete a specific app stream by its key.

  ## Parameters

  - stream_key: Stream to delete.

  ## Examples

    iex> ExPnut.AppStreams.delete_stream(client, "butterball")
  """
  def delete_stream(client, stream_key) do
    delete(client, "/streams/#{stream_key}")
  end
end
