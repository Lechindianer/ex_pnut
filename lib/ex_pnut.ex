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

  defdelegate me(access_token), to: ExPnut.Streams

  defdelegate unified(access_token), to: ExPnut.Streams

  defdelegate mentions(access_token, user_id), to: ExPnut.Streams

  defdelegate posts(access_token, user_id), to: ExPnut.Streams

  defdelegate global(access_token), to: ExPnut.Streams

  defdelegate tag(access_token, tag), to: ExPnut.Streams
end
