defmodule ExPnut do
  @moduledoc """
  Documentation for ExPnut.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExPnut.hello()
      :world

  """

  defdelegate get_app_access_token, to: ExPnut.Auth

  defdelegate me(access_token), to: ExPnut.Posts.Streams

  defdelegate unified(access_token), to: ExPnut.Posts.Streams

  defdelegate mentions(access_token, user_id), to: ExPnut.Posts.Streams

  defdelegate posts(access_token, user_id), to: ExPnut.Posts.Streams

  defdelegate global(access_token), to: ExPnut.Posts.Streams

  defdelegate tag(access_token, tag), to: ExPnut.Posts.Streams
end
