defmodule ExPnut.Posts.Search do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams
  alias ExPnut.Posts.SearchParams

  @moduledoc """
  Post Search

  [https://pnut.io/docs/api/resources/posts/search](https://pnut.io/docs/api/resources/posts/search)
  """

  @doc """
  Retrieve a list of posts filtered by the given criteria.
  """
  def search(
        client,
        %SearchParams{} = search_params \\ %SearchParams{},
        %PostParams{} = post_params \\ %PostParams{}
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

    get(client, "/posts/search?#{params}", post_params)
  end
end
