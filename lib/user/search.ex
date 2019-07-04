defmodule ExPnut.User.Search do
  import ExPnut.Helper.HTTP
  alias ExPnut.User.UserParams
  alias ExPnut.User.SearchParams

  @moduledoc """
  User Search

  [https://pnut.io/docs/api/resources/users/search](https://pnut.io/docs/api/resources/user/search)
  """

  @doc """
  Retrieve a list of users filtered by the given criteria.
  """
  def search(
        client,
        %SearchParams{} = search_params,
        %UserParams{} = user_params \\ %UserParams{}
      ) do
    filtered_search_params =
      search_params
      |> Map.from_struct()
      |> Map.to_list()
      |> Enum.filter(fn {_, value} -> value !== nil end)

    params =
      filtered_search_params
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    get(client, "/users/search?#{params}", user_params)
  end
end
