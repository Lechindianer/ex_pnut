defmodule ExPnut.User.Blocking do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Blocking a user prevents the blocked user and the blocking user from seeing each other on the network except in a
  few necessary places.

  Endpoints:
  - Get blocked users
  - Block a user
  - Unblock a user

  [https://pnut.io/docs/api/resources/users/blocking](https://pnut.io/docs/api/resources/users/blocking)
  """

  @doc """
  Retrieve a list of blocked users. Users may only see their own list of blocked users.
  """
  def get_blocked(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}/blocked", user_params)
  end

  @doc """
  Block a user. Blocked users will not show up in future requests, the same as if they were muted. Blocked users also
  cannot retrieve this authorized user in their requests. Can do so even if the other user is blocking you (but will
  only return an ID of the blocked user).
  """
  def block(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    put(client, "/users/#{user_id}/block", user_id, user_params)
  end

  @doc """
  Unblock a user. Can do so even if the other user is blocking you (but will only return an ID of the blocked user).
  """
  def unblock(client, user_id) do
    delete(client, "/users/#{user_id}/block")
  end
end
