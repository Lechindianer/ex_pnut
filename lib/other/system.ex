defmodule ExPnut.Other.System do
  import ExPnut.Helper.HTTP

  @moduledoc """
  The System endpoint gives access to system-wide information.

  Endpoints:
  - Get configuration
  - Get statistics

  [https://pnut.io/docs/api/resources/other/system](https://pnut.io/docs/api/resources/other/system)
  """

  @doc """
  Retrieve a list of parameters for interacting with the API.

  Returns a catalog of parameters
  """
  def sys_config(client) do
    get(client, "/sys/config", nil)
  end

  @doc """
  Retrieve basic statistics for the network.

  Returns a list of statistics
  """
  def sys_stats(client) do
    get(client, "/sys/stats", nil)
  end
end
