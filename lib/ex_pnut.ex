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
end
