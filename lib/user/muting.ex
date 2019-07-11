defmodule ExPnut.User.Muting do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Muting a user will prevent them from being visible to the muting user unless specifically requested.

  Endpoints:
  - Get muted users
  - Mute a user
  - Unmute a user

  [https://pnut.io/docs/api/resources/users/muting](https://pnut.io/docs/api/resources/users/muting)
  """

  @doc """
  Retrieve a list of muted users. Users may only see their own list of muted users.
  """
  def get_muted(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}/muted", user_params)
  end

  @doc """
  Mute a user. Muted users will not appear in future requests.
  """
  def mute(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    put(client, "/users/#{user_id}/mute", [user_id], user_params)
  end

  @doc """
  Unmute a user.
  """
  def unmute(client, user_id) do
    delete(client, "/users/#{user_id}/mute")
  end
end
