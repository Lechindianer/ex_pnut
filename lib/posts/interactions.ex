defmodule ExPnut.Posts.Interactions do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams
  alias ExPnut.Posts.InteractionParams

  @moduledoc """
  This endpoint mirrors User Interactions, but for a single post, instead of a user, and it does not include objects.

  [https://pnut.io/docs/api/resources/posts/interactions](https://pnut.io/docs/api/resources/posts/interactions)
  """

  @doc """
  Retrieve actions executed against a post.
  """
  def get_interactions(
        client,
        post_id,
        %InteractionParams{} = interaction_params \\ %InteractionParams{},
        %PostParams{} = post_params \\ %PostParams{}
      ) do
    interaction_params =
      interaction_params
      |> ExPnut.Helper.UrlParams.build()
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    get(client, "/posts/#{post_id}/interactions?#{interaction_params}", post_params)
  end
end
