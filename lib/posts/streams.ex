defmodule ExPnut.Posts.Streams do
  import ExPnut.Helper.HTTP

  @moduledoc false

  def me(client) do
    get(client, "/posts/streams/me")
  end

  def unified(client) do
    get(client, "/posts/streams/unified")
  end

  def mentions(client, user_id) do
    get(client, "/users/#{user_id}/mentions")
  end

  def posts(client, user_id) do
    get(client, "/users/#{user_id}/posts")
  end

  def global(client) do
    get(client, "/posts/streams/global")
  end

  def tag(client, tag) do
    get(client, "/posts/tag/#{tag}")
  end
end
