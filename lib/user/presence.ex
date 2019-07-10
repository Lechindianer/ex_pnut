defmodule ExPnut.User.Presence do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  A user's presence is the recent status of that user. Each updated presence lasts for 15 minutes, or until another
  status is given. Users who do not have a current status show up as "offline".

  A user's status can be updated on any authenticated call by simply including the update_presence query parameter
  with a status for its value. If this method is attempted, the response's meta.updated_presence key will be set and
  true. If it fails to update, it will be false.

  Endpoints:
  - Get present users
  - Get a user's presence
  - Update the authenticated user's presence

  [https://pnut.io/docs/api/resources/users/presence](https://pnut.io/docs/api/resources/users/presence)
  """

  @doc """
  Retrieve all users' presence statuses that are not "offline".
  """
  def get_presence(client, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/presence", user_params)
  end

  @doc """
  Retrieve a user's presence.

  If the user has never set a presence, "last_seen_at" will not be set.
  """
  def get_user_presence(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}/presence", user_params)
  end

  @doc """
  Update a user's presence.

  If the "update_presence" query parameter is set on this call, it will override this call. It will not occur twice.

  | Name     | Description                                                                                                                                                                                                       |
  |----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | presence | A string up to 100 unicode characters. If not set, or if it is set to 1, it will be updated to "online". A value of "offline" or 0 will delete the user's presence and remove them from the list of users online. |
  """
  def set_presence(client, presence, %UserParams{} = user_params \\ %UserParams{}) do
    put(client, "/users/me/presence", "presence=#{presence}", user_params)
  end
end
