defmodule ExPnut.User.Interactions do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams

  @moduledoc """
  Users may see some common actions that have been made against their self, posts, polls, etcetera. Events from
  multiple users are grouped into the most recent event of the same type and object, within a short time.

  E.g., if two users repost the same post of yours within a day, they may be included in a single event. But further
  apart, they would be included as separate events.

  **Objects by action**

  | Action                  | Objects |
  |-------------------------|---------|
  | bookmark, reply, repost | Post    |
  | follow                  | User    |
  | poll_response           | Poll    |

  The poll included from a poll_response action is static and abbreviated like that included embedded in
  io.pnut.core.poll raw. If the poll is anonymous, users will not be included.

  [https://pnut.io/docs/api/resources/users/interactions](https://pnut.io/docs/api/resources/users/interactions)
  """

  @doc """
  Retrieve all actions executed against the authenticated user and their content.
  """
  def get_interactions(
        client,
        %UserParams{} = user_params \\ %UserParams{}
      ) do
    get(client, "/users/me/interactions", user_params)
  end

  @doc """
  Retrieve actions executed against the authenticated user and their content.

  **Query parameters**

  ## Parameters

  - filters: Comma-separated list of actions to filter by. `?filters=bookmark` will only include bookmarks.  Allowed:
  `bookmark, repost, reply, follow, poll_response`.
  - exclude: Comma-separated list of actions to exclude. `?exclude=bookmark` will return all actions except bookmarks.
  If `filters` is also specified, this is ignored.
  """
  def get_queried_interactions(
        client,
        interaction_params,
        %UserParams{} = user_params \\ %UserParams{}
      ) do
    params =
      interaction_params
      |> Map.to_list()
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    get(client, "/users/me/interactions?#{params}", user_params)
  end
end
