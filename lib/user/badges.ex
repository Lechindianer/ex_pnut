defmodule ExPnut.User.Badges do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Badges are accessible to users who are current badge holders.

  A user can set what badge to display on their profile from their account, or a client can update it by updating the
  user.

  Endpoints:
  - Get a badge
  - Get all badges
  - Get the authenticated user's badges

  [https://pnut.io/docs/api/resources/users/badges](https://pnut.io/docs/api/resources/users/badges)
  """

  @doc """
  Retrieve a badge object.
  """
  def get_badge(client, badge_id, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/badges/#{badge_id}", user_params)
  end

  @doc """
  Retrieve a list of all badges. It is not paginated.
  """
  def get_badges(client, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/badges", user_params)
  end

  @doc """
  Retrieve a list of all badges for the authenticated user. It is not paginated.
  """
  def get_my_badges(client, %UserParams{} = user_params \\ %UserParams{}) do
    get(client, "/users/me/badges", user_params)
  end
end
