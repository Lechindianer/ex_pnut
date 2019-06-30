defmodule ExPnut.Posts.Reposts do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Reposting is a special action. Reposts act as complete posts in themselves, with the "original" post embedded as an additional object. Unlike normal posts, actions (reply, repost, bookmark) cannot be executed against a repost.

  [https://pnut.io/docs/api/resources/posts/reposts](https://pnut.io/docs/api/resources/posts/reposts)
  """

  @doc """
  Repost another post. The repost will show up in followers' streams if they have not seen another repost of the same within the last week, and if the reposted post is not in their recent stream. It is created in its own thread, not the thread of the original post. This increments a user's post count.
  """
  def repost(client, post_id, post_params = %PostParams{} \\ %PostParams{}) do
    post_id_jsonified =
      post_id
      |> Jason.encode()
      |> elem(1)

    put(client, "/posts/#{post_id}/repost", post_id_jsonified, post_params)
  end

  @doc """
  Delete a repost. The actual repost is completely deleted; it does not leave behind a thread or deleted post to look up.

  Users can also delete their own reposts even if they no longer have access to the original reposted post (e.g., they were blocked). In that case, the returned post in the data field is simply {"id":POST_ID,"you_reposted":false}.
  """
  def delete_repost(client, post_id) do
    delete(client, "/posts/#{post_id}/repost")
  end
end
