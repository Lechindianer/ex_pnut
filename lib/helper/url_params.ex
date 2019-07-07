defmodule ExPnut.Helper.UrlParams do
  @moduledoc false

  @doc """
  Build url parameters from structs
  """
  def build(params) do
    params
    |> Map.from_struct()
    |> Map.to_list()
  end
end
