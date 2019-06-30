defmodule ExPnut.Posts.Explore do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Explore streams are basically pre-built searches with some simple criteria.
  """

  @doc """
  Retrieve a list of explore streams.
  """
  def explore(client, post_params = %PostParams{} \\ %PostParams{}) do
    get(client, "/posts/streams/explore", post_params)
  end

  @doc """
  Retrieve a list of posts in an explore stream.

  Slug can be of the following values: "conversations", "photos", "trending" and "missed_conversations"
  """
  def explore_slug(client, slug, post_params = %PostParams{} \\ %PostParams{}) do
    get(client, "/posts/streams/explore/#{slug}", post_params)
  end
end
