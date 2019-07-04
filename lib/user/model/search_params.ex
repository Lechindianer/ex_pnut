defmodule ExPnut.User.SearchParams do
  @moduledoc """
  [https://pnut.io/docs/api/resources/users/search](https://pnut.io/docs/api/resources/users/search)
  """

  @enforce_keys [:q]

  defstruct [
    :q,
    :locale,
    :timezone,
    :types,
    order: "relevance"
  ]
end
