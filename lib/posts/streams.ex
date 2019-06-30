defmodule ExPnut.Posts.Streams do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def me(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/me", post_params)
  end

  def unified(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/unified", post_params)
  end

  def mentions(client, user_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/users/#{user_id}/mentions", post_params)
  end

  def posts(client, user_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/users/#{user_id}/posts", post_params)
  end

  def global(client, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/streams/global", post_params)
  end

  def tag(client, tag, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/tag/#{tag}", post_params)
  end
end
