defmodule ExPnut.Client do
  @moduledoc """
  Create a new ExPnut client. This is necessary to use the rest of ExPnut library.
  """

  defstruct auth: nil, endpoint: "https://api.pnut.io/v0"

  @type auth :: %{user: binary, password: binary} | %{access_token: binary}
  @type t :: %__MODULE__{auth: auth | nil, endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(binary) :: t
  def new(access_token) when is_binary(access_token), do: %__MODULE__{auth: access_token}

  @spec new(map()) :: t
  def new(%{user: _, password: _} = auth), do: %__MODULE__{auth: auth}

  @spec new(map()) :: t
  def new(%{access_token: _} = auth), do: %__MODULE__{auth: auth}

  @spec new(binary, binary) :: t
  def new(access_token, endpoint) when is_binary(access_token) and is_binary(endpoint),
    do: %__MODULE__{auth: access_token, endpoint: endpoint}
end
