defmodule ExPnut.Posts.Streams do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Get various streams

  [https://pnut.io/docs/api/resources/posts/streams](https://pnut.io/docs/api/resources/posts/streams)
  """

  @doc """
  The authenticated user's stream of posts from their followers and themself.
  """
  def me(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/me", post_params)
  end

  @doc """
  A combined Personal Stream including the authenticated user's mentions.
  """
  def unified(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/unified", post_params)
  end

  @doc """
  Posts mentioning the specified user.
  """
  def mentions(client, user_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/users/#{user_id}/mentions", post_params)
  end

  @doc """
  Posts created by the specified user.

  If a user looks up a user they blocked or muted, the posts will still be retrieved.
  """
  def posts(client, user_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/users/#{user_id}/posts", post_params)
  end

  @doc """
  A stream of all users' public posts.
  """
  def global(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/global", post_params)
  end

  @doc """
  A stream of all posts that include the specified tag.
  """
  def tag(client, tag, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/tag/#{tag}", post_params)
  end
end
