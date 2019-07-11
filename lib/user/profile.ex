defmodule ExPnut.User.Profile do
  import ExPnut.Helper.HTTP
  import ExPnut.Helper.JSON
  alias ExPnut.User.UserParams

  @moduledoc """
  Receive or update user data.

  Endpoints:
  - Completely update a user
  - Partially update a user
  - Get user avatar
  - Update user avatar
  - Get user cover
  - Update user cover

  [https://pnut.io/docs/api/resources/users/profile](https://pnut.io/docs/api/resources/users/profile)
  """

  @doc """
  Replaces the authenticated user's profile. Anything not included is removed.

  Requires a user object with "application/json" Content-Type. "timezone" and "locale" are required. Not including
  "name" or "text" will remove them from the profile.

  "text" must be a child key of "content".

  Returns the updated user object.
  """
  def update_profile(client, user_profile, %UserParams{} = user_params \\ %UserParams{}) do
    user_profile = jsonify(user_profile)

    put_json(client, "/users/me", user_profile, user_params)
  end

  @doc """
  Updates only specified parts of the authenticated user's profile.

  Requires a user object with "application/json" content type. "name", "text", "timezone", and "locale" are current options.

  "text" must be a child key of "content".

  Returns the updated user object.
  """
  def patch_user(client, user_profile, %UserParams{} = user_params \\ %UserParams{}) do
    user_profile = jsonify(user_profile)

    patch(client, "/users/me", user_profile, user_params)
  end

  @doc """
  This endpoint will return an HTTP 302 redirect to the user’s current avatar image. It will include any query string
  parameters you pass to the endpoint.

  ## Parameters

  - user_id: ID of the user whose avatar to retrieve.
  """
  def get_avatar(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    # TODO: Support height and width parameters
    get(client, "/users/#{user_id}/avatar", user_params)
  end

  @doc """
  Uploads a new avatar image for the authenticated user.

  The uploaded image will be cropped to square and must be smaller than 2MiB.

  Can specify "Content-Type" of "application/json" with the key "{from_url}", or a "Content-Type" of
  "multipart/form-data", with the file as key "avatar". "Content-Length" header must also be set.
  """
  def set_avatar(client, avatar, %UserParams{} = user_params \\ %UserParams{}) do
    post(client, "/users/me/avatar", avatar, user_params)
  end

  @doc """
  This endpoint will return an HTTP 302 redirect to the user’s current cover image. It will include any query string
  parameters you pass to the endpoint.

  ## Parameters

  - user_id: ID of the user whose cover image to retrieve.
  """
  def get_cover(client, user_id, %UserParams{} = user_params \\ %UserParams{}) do
    # TODO: Support height and width parameters
    get(client, "/users/#{user_id}/cover", user_params)
  end

  @doc """
  Uploads a new cover image for the authenticated user.

  The uploaded image must be smaller than 4MiB, with a width of at least 960px and height of at least 223px.

  If the width / height ratio is less than 2 to 1, the height will be cropped to height / 4.3. A 10000x10000px image
  would be cropped to 10000x2326px.

  Can specify "Content-Type" of "application/json" with the key "{from_url}", or a "Content-Type" of
  "multipart/form-data", with the file as key "avatar". "Content-Length" header must also be set.
  """
  def set_cover(client, cover, %UserParams{} = user_params \\ %UserParams{}) do
    post(client, "/users/me/avatar", cover, user_params)
  end
end
