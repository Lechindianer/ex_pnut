defmodule ExPnut.User.Following do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Endpoints:
  - Get followed users
  - Get a user's followers
  - Follow a user
  - Unfollow a user

  [https://pnut.io/docs/api/resources/users/following](https://pnut.io/docs/api/resources/users/following)
  """

  @doc """
  Retrieve a list of user objects that the specified user is following.
  """
  def get_following(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}/following", user_params)
  end

  @doc """
  Retrieve a list of user objects that are following the specified user.
  """
  def get_followers(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/#{user_id}/followers", user_params)
  end

  @doc """
  Follow a user.
  """
  def follow(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    put(client, "/users/#{user_id}/follow", [user_id], user_params)
  end

  @doc """
  Unfollow a user.
  """
  def unfollow(client, user_id) do
    delete(client, "/users/#{user_id}/follow")
  end
end
