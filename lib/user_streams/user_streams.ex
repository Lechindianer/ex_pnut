defmodule ExPnut.UserStreams do
  import ExPnut.Helper.HTTP

  @moduledoc """
  User streams are long-lasting connections between the API and user-facing clients, for near-realtime interaction.
  They are similar to [App Streams](https://pnut.io/docs/api/resources/app-streams) but for individual users.

  Look at [How To: User Streams](https://pnut.io/docs/api/how-to/user-streams) for details on usage.

  Endpoints:
  - Delete a stream
  - Delete a subscription

  [https://pnut.io/docs/api/resources/user-streams](https://pnut.io/docs/api/resources/user-streams)
  """

  @doc """
  Delete a user stream.
  """
  def delete_user_stream(client, connection_id) do
    delete(client, "/users/me/streams/#{connection_id}")
  end

  @doc """
  Delete a subscription for a user stream.
  """
  def delete_subscription(client, connection_id, subscription_id) do
    delete(client, "/users/me/streams/#{connection_id}/#{subscription_id}")
  end
end
