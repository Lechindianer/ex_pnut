defmodule ExPnut.Posts.Lookup do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Get single, multiple or revisions of posts.
  """

  @doc """
  Retrieve a post object.
  """
  def get_post(client, post_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/#{post_id}", post_params)
  end

  @doc """
  Retrieve a list of specified post objects. Only retrieves the first 200 found.
  """
  def get_posts(client, post_ids, %PostParams{} = post_params \\ %PostParams{}) do
    post_ids_query_param = Enum.join(post_ids, ",")

    get(client, "/posts?ids=#{post_ids_query_param}", post_params)
  end

  @doc """
  Retrieve a list of previous versions of a post, not including the most recent. Currently a post can only have one previous version.

  Revisions returned will have revision as a String number indicating which version of the post it is. Revisions start at "0".
  """
  def get_revisions(client, post_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/#{post_id}/revisions", post_params)
  end
end
