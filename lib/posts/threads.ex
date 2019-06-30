defmodule ExPnut.Posts.Threads do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Get posts in a thread

  https://pnut.io/docs/api/resources/posts/threads
  """

  @doc """
  Retrieve posts within a thread. Threads are separated by what root post all posts below it have replied to.
  """
  def get_thread(client, post_id, post_params = %PostParams{} \\ %PostParams{}) do
    get(client, "/posts/#{post_id}/thread", post_params)
  end
end
