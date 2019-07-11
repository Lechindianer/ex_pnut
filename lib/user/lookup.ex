defmodule ExPnut.User.Lookup do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Lookup one or multiple users.

  Endpoints:
  - Get a user
  - Get multiple users
  - Get app user IDs
  - Get app user tokens

  [https://pnut.io/docs/api/resources/users/lookup](https://pnut.io/docs/api/resources/users/lookup)
  """

  @doc """
  Retrieve a user object.

  ## Parameters

  - user_id: User ID or username with "@" symbol of the user to retrieve.
  """
  def get_user(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}", user_params)
  end

  @doc """
  Retrieve a list of specified user objects. Only retrieves the first 200 found.

  ## Parameters

  - user_ids: List of user IDs. IDs are required; no other identifiers are allowed.
  """
  def get_users(client, user_ids, %UserParams{} = user_params \\ %UserParams{}) do
    user_ids = Enum.join(user_ids, ",")

    get(client, "/users?ids=#{user_ids}", user_params)
  end

  @doc """
  Retrieve a list of all user IDs that authorize the requesting app. It is not paginated.

  Requires an app token.
  """
  def get_my_users(client, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/apps/me/users/ids", user_params)
  end

  @doc """
  Retrieve a list of all user token objects that authorize the requesting app. Not currently paginated.

  Requires an app token.
  """
  def get_my_tokens(client, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/apps/me/users/tokens", user_params)
  end
end
