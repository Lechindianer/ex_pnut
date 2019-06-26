defmodule ExPnut.Posts.Streams do
  import ExPnut.Helper.HTTP

  @moduledoc false

  def me(access_token) do
    get(access_token, "/posts/streams/me")
  end

  def unified(access_token) do
    get(access_token, "/posts/streams/unified")
  end

  def mentions(access_token, user_id) do
    get(access_token, "/users/#{user_id}/mentions")
  end

  def posts(access_token, user_id) do
    get(access_token, "/users/#{user_id}/posts")
  end

  def global(access_token) do
    get(access_token, "#/posts/streams/global")
  end

  def tag(access_token, tag) do
    get(access_token, "/posts/tag/#{tag}")
  end
end
